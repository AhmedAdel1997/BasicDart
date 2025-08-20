import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../cubit/logout/logout_cubit.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(),
      child: ProfileBody(),
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: SizedBox(
        width: 1.sw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocListener<LogoutCubit, LogoutState>(
              listener: (context, state) async {
                if (state is LogoutSuccess) {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.remove('token');
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                }
                if (state is LogoutError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                }
              },
              child: BlocBuilder<LogoutCubit, LogoutState>(
                builder: (context, state) {
                  if (state is LogoutLoading) {
                    return CircularProgressIndicator.adaptive();
                  }
                  return TextButton(
                    onPressed: () async {
                      await context.read<LogoutCubit>().logout();
                    },
                    child: Text('Logout', style: TextStyle(fontSize: 20)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
