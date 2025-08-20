import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  final dio = Dio(BaseOptions(baseUrl: 'https://dragon-lines.com/api'));

  Future<void> logout() async {
    emit(LogoutLoading());
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token == null) return;
    try {
      await dio.post(
        '/logout',
        data: {},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      emit(LogoutSuccess());
    } catch (e) {
      log(e.toString());
      emit(LogoutError(errorMessage: e.toString()));
    }
  }
}
