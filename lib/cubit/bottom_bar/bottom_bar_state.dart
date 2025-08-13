part of 'bottom_bar_cubit.dart';

class BottomBarState {
  final int index;
  final List<Widget> screens;

  BottomBarState({
    required this.index,
    this.screens = const [HomeScreen(), NotificationsScreen(), ProfileScreen()],
  });
}

final class BottomBarInitial extends BottomBarState {
  BottomBarInitial()
    : super(
        index: 0,
        screens: [HomeScreen(), NotificationsScreen(), ProfileScreen()],
      );
}

final class BottomBarNewState extends BottomBarState {
  BottomBarNewState()
    : super(
        index: 0,
        screens: [HomeScreen(), NotificationsScreen(), ProfileScreen()],
      );
}
