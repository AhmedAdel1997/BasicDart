import 'dart:developer';

import 'package:dratbasics/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'notifications_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [HomeScreen(), NotificationsScreen(), ProfileScreen()];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        //if in home close the application
        if (_currentIndex == 0) {
          SystemNavigator.pop();
        }
        //better user experience
        setState(() {
          _currentIndex = 0;
        });
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //action
          },
          backgroundColor: Colors.indigo,
          child: Icon(Icons.add, color: Colors.white),
        ),

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
          currentIndex: _currentIndex,
          selectedItemColor: Colors.indigo,
          unselectedItemColor: Colors.grey,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
              log('current index: $_currentIndex');
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _currentIndex == 0 ? Colors.indigo : Colors.grey,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                color: _currentIndex == 1 ? Colors.indigo : Colors.grey,
              ),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: _currentIndex == 2 ? Colors.indigo : Colors.grey,
              ),
              label: 'Profile',
            ),
          ],
        ),
        body: screens[_currentIndex],
      ),
    );
  }
}
