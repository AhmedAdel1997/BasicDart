import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/text_styles.dart';
import 'cubit/bottom_bar/bottom_bar_cubit.dart';
import 'cubit/counter_cubit/counter_cubit.dart';
import 'ui/main_screen.dart';

//state management -- flutter_bloc
//caching -- shared_preferences
//networking -- dio

void main() async {
  //main function
  runApp(const MyApp()); //run the application
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => CounterCubit()),
            BlocProvider(create: (context) => BottomBarCubit()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: fontFamily,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: child,
          ),
        );
      },
      child: const MainScreen(),
    );
  }
}
