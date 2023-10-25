part of 'interstitial_ad_cubit.dart';

@immutable
abstract class AdState {}

class InterstitialAdCubitAdInitial extends AdState {}

class InterstitialAdCubitAdLoading extends AdState {}

class InterstitialAdCubitAdError extends AdState {}

class InterstitialAdCubitAdLoaded extends AdState {}
