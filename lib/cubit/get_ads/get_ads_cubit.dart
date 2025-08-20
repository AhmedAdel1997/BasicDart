import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/ad_model.dart';

part 'get_ads_state.dart';

class GetAdsCubit extends Cubit<GetAdsState> {
  GetAdsCubit() : super(GetAdsInitial());

  final dio = Dio(BaseOptions(baseUrl: 'https://dragon-lines.com/api'));

  Future<void> getAds() async {
    emit(GetAdsLoading());
    try {
      //url
      final response = await dio.get('/advertisements');

      //parsing data
      final AdsResponse adsResponse = AdsResponse.fromJson(response.data);
      emit(GetAdsSuccess(ads: adsResponse.data));
    } catch (e) {
      log(e.toString());
      emit(GetAdsError(errorMessage: e.toString()));
    }
  }
}
