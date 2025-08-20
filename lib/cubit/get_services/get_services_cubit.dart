import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/service_model.dart';

part 'get_services_state.dart';

//  JWT token
//  85|ss7K3XRtSbeudUx77cgKCb9SQbzQIAtq6dRoFJyj
class GetServicesCubit extends Cubit<GetServicesState> {
  GetServicesCubit() : super(GetServicesInitial());

  final dio = Dio(
    BaseOptions(baseUrl: 'https://dragon-lines.com/api', headers: {}),
  );

  //handle errors
  Future<void> getServices() async {
    emit(GetServicesLoading());
    try {
      final response = await dio.get('/services');
      final serviceResponse = ServiceResponse.fromJson(response.data);
      emit(GetServicesSuccess(services: serviceResponse.data.data));
    } catch (e) {
      log(e.toString());
      emit(GetServicesError(errorMessage: e.toString()));
    }
  }
}
