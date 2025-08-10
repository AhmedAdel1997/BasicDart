import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

// Read  Listener = fasle
// Watch  Listener = true

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    log('increment: ${state + 1}');
    emit(state + 1);
  }

  void decrement() {
    log('decrement: ${state - 1}');
    emit(state - 1);
  }
}
