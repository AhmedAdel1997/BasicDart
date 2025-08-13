import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/bottom_bar/bottom_bar_cubit.dart';
import '../cubit/counter_cubit/counter_cubit.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<BottomBarCubit>().changeIndex(0);
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterCubit, int>(
            builder: (context, state) {
              return Center(
                child: Text(
                  'Notifications $state',
                  style: TextStyle(fontSize: 20.sp, color: Colors.black),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
