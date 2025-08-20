part of 'splash_cubit.dart';

sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class UserLoggedInState extends SplashState {}

final class UserNotLoggedState extends SplashState {}
