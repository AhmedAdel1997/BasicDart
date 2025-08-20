import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_ads_state.dart';

class GetAdsCubit extends Cubit<GetAdsState> {
  GetAdsCubit() : super(GetAdsInitial());

  final dio = Dio(BaseOptions(baseUrl: 'https://dragon-lines.com/api'));

  Future<void> getAds() async {
    try {
      final response = await dio.get('/advertisements');
      log(response.data['data'][1]['title'].toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
