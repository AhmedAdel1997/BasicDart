part of 'get_ads_cubit.dart';

sealed class GetAdsState {}

final class GetAdsInitial extends GetAdsState {}

final class GetAdsLoading extends GetAdsState {}

final class GetAdsSuccess extends GetAdsState {
  final List<AdModel> ads;

  GetAdsSuccess({required this.ads});
}

final class GetAdsError extends GetAdsState {
  final String errorMessage;

  GetAdsError({required this.errorMessage});
}
