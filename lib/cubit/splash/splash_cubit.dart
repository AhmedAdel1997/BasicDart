import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    if (token == null) {
      emit(UserNotLoggedState());
    } else {
      emit(UserLoggedInState());
    }
  }
}
