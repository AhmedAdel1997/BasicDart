part of 'get_services_cubit.dart';

sealed class GetServicesState {}

final class GetServicesInitial extends GetServicesState {}

final class GetServicesLoading extends GetServicesState {}

final class GetServicesSuccess extends GetServicesState {
  final List<ServiceModel> services;

  GetServicesSuccess({required this.services});
}

final class GetServicesError extends GetServicesState {
  final String errorMessage;

  GetServicesError({required this.errorMessage});
}
