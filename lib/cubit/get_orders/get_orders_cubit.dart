import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  GetOrdersCubit() : super(GetOrdersInitial());

  final dio = Dio(
    BaseOptions(baseUrl: 'https://dragon-lines.com/api', headers: {}),
  );

  Future<void> getOrders({required String status}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      if (token == null) return;
      log(token);
      final response = await dio.get(
        '/orders',
        queryParameters: {"status": status},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      log(response.data.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
