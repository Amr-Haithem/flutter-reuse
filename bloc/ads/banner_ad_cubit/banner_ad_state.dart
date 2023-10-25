// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'banner_ad_cubit.dart';

@immutable
abstract class BannerAdState {}

class BannerAdInitial extends BannerAdState {}

class BannerAdLoading extends BannerAdState {}

class BannerAdLoaded extends BannerAdState {
  final BannerAd bannerAd;
  BannerAdLoaded({
    required this.bannerAd,
  });
}

class BannerAdError extends BannerAdState {}
