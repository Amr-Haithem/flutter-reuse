import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:meta/meta.dart';

import '../../../consts/ad_ids.dart';

part 'banner_ad_state.dart';

class BannerAdCubit extends Cubit<BannerAdState> {
  BannerAdCubit() : super(BannerAdInitial());

  void initBannerAd() async {
    emit(BannerAdLoading());
    try {
      BannerAd bannerAd = BannerAd(
          size: AdSize.fullBanner,
          adUnitId: bannerAdUnitId,
          listener: _bannerAdListener(),
          request: const AdRequest())
        ..load();
      emit(BannerAdLoaded(bannerAd: bannerAd));
    } catch (e) {
      emit(BannerAdError());
    }
  }

  BannerAdListener _bannerAdListener() {
    return BannerAdListener(
        onAdLoaded: (ad) {},
        onAdFailedToLoad: (ad, error) {
          emit(BannerAdError());
          ad.dispose();
        },
        onAdOpened: (ad) {});
  }
}
