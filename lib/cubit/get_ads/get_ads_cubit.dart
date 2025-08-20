import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/service_model.dart';

part 'get_ads_state.dart';

//  JWT token
//  85|ss7K3XRtSbeudUx77cgKCb9SQbzQIAtq6dRoFJyj
class GetAdsCubit extends Cubit<GetAdsState> {
  GetAdsCubit() : super(GetAdsInitial());

  final dio = Dio(
    BaseOptions(baseUrl: 'https://dragon-lines.com/api', headers: {}),
  );

  //handle errors
  Future<void> getAds() async {
    emit(GetAdsLoading());
    try {
      final response = await dio.get('/services');
      final serviceResponse = ServiceResponse.fromJson(response.data);
      emit(GetAdsSuccess(services: serviceResponse.data.data));
    } catch (e) {
      log(e.toString());
      emit(GetAdsError(errorMessage: e.toString()));
    }
  }
}
