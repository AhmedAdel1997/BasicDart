import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Read  Listener = false
// Watch  Listener = true

//simple cubit
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

  Future<void> saveCounter() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("COUNTER_VALUE", state);
  }

  Future<void> getCounter() async {
    final prefs = await SharedPreferences.getInstance();
    final counter = prefs.getInt("COUNTER_VALUE");
    if (counter != null) {
      emit(counter);
    }
  }

  Future<void> deleteCounter() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("COUNTER_VALUE");
    emit(0);
  }
}
