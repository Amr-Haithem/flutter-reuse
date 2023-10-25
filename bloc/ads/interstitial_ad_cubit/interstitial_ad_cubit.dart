import 'package:bloc/bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:meta/meta.dart';

import '../../../consts/ad_ids.dart';

part 'interstitial_ad_state.dart';

class InterstitialAdCubit extends Cubit<AdState> {
  InterstitialAdCubit() : super(InterstitialAdCubitAdInitial());
  _setFullScreenContentCallback(InterstitialAd ad) {
    ad.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (InterstitialAd ad) {},
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
        });
  }

  void loadAndShowAd() async {
    emit(InterstitialAdCubitAdLoading());

    try {
      await InterstitialAd.load(
          adUnitId: interstitialAdUnitId,
          request: const AdRequest(),
          adLoadCallback:
              InterstitialAdLoadCallback(onAdLoaded: (InterstitialAd ad) {
            ad.show();
            _setFullScreenContentCallback(ad);

            emit(InterstitialAdCubitAdLoaded());
          }, onAdFailedToLoad: (LoadAdError laodAdError) {
            throw Exception(laodAdError.message);
          }));
    } catch (e) {
      emit(InterstitialAdCubitAdError());
    }
  }
}
