import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ui/home_screen.dart';
import '../../ui/notifications_screen.dart';
import '../../ui/profile_screen.dart';

part 'bottom_bar_state.dart';

class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit() : super(BottomBarInitial());

  void changeIndex(int index) {
    emit(BottomBarState(index: index));
  }

  void emitNewState() {
    emit(BottomBarNewState());
  }
}
