import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final dio = Dio(
    BaseOptions(baseUrl: 'https://dragon-lines.com/api', headers: {}),
  );

  Future<void> login({required String phone, required String password}) async {
    emit(LoginLoading());
    try {
      final response = await dio.post(
        '/login',
        data: {
          'phone': phone,
          'password': password,
          //---------
          'device_token': 'ffffff',
          "test_mode": '1',
          "preferred_locale": "ar",
        },
      );
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', response.data['data']['token']);
      log(response.data['data']['token']);
      emit(LoginSuccess());
    } catch (e) {
      log(e.toString());
      emit(LoginError(errorMessage: 'Password or phone number is incorrect'));
    }
  }
}
