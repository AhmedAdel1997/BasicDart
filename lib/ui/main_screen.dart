import 'package:dratbasics/cubit/bottom_bar/bottom_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/get_services/get_services_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetServicesCubit>().getServices();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarCubit, BottomBarState>(
      builder: (context, state) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            //if in home close the application
            if (state.index == 0) {
              SystemNavigator.pop();
            }
            //better user experience
            context.read<BottomBarCubit>().changeIndex(0);
          },
          child: Scaffold(
            backgroundColor: Colors.black,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,

            // floatingActionButton: Container(
            //   height: 60.h,
            //   width: 60.w,
            //   decoration: BoxDecoration(
            //     color: Colors.indigo,
            //     shape: BoxShape.circle,
            //   ),
            //   child: Icon(Icons.add, color: Colors.white),
            // ),
            bottomNavigationBar: BottomNavigationBar(
              selectedLabelStyle: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
              currentIndex: state.index,
              selectedItemColor: Colors.indigo,
              unselectedItemColor: Colors.grey,
              onTap: (int index) {
                context.read<BottomBarCubit>().changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: state.index == 0 ? Colors.indigo : Colors.grey,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications,
                    color: state.index == 1 ? Colors.indigo : Colors.grey,
                  ),
                  label: 'Notifications',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: state.index == 2 ? Colors.indigo : Colors.grey,
                  ),
                  label: 'Profile',
                ),
              ],
            ),
            body: state.screens[state.index],
          ),
        );
      },
    );
  }
}
