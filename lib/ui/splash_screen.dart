import 'package:dratbasics/core/colors.dart';
import 'package:dratbasics/cubit/splash/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_screen.dart';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      context.read<SplashCubit>().checkLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UserLoggedInState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainScreen()),
          );
        }
        if (state is UserNotLoggedState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 240.h,
                width: 240.w,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
