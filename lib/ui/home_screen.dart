// import 'dart:developer';

// import 'package:dratbasics/core/constructor_test.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// //stateful lifecycle

// //-createState() --->1
// //-initState() ---> 2 //before build
// //-dispose()
// //-build() ----> 3

// class HomeScreen extends StatefulWidget {
//   final UserModel user;
//   const HomeScreen({super.key, required this.user});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//     log('initState');
//   }

//   @override
//   void dispose() {
//     log('dispose');
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     log('build');
//     return Scaffold(
//       body: SizedBox(
//         width: double.infinity,
//         height: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             TextButton(
//               onPressed: () {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => MainScreen()),
//                 // );
//               },
//               child: Text(
//                 'Hello, ${widget.user.name} ${widget.user.email}\n ${widget.user.age}\n ${widget.user.phone}',
//                 style: TextStyle(color: Colors.black, fontSize: 30.sp),
//               ),
//             ),
//             SizedBox(height: 20.h),

//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   // call build function
//                   widget.user.name = 'Ahmed adel';
//                 });
//               },
//               child: Text(
//                 'Change user name',
//                 style: TextStyle(fontSize: 20.sp),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter_cubit/counter_cubit.dart';
import '../cubit/get_ads/get_ads_cubit.dart';
import '../cubit/get_orders/get_orders_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CounterCubit>().getCounter();
  }

  // int counter = 0;
  @override
  Widget build(BuildContext context) {
    log('build');
    // final counterCubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<GetOrdersCubit>().getOrders();
        },

        backgroundColor: Colors.indigo,
        child: Icon(Icons.get_app, color: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Center(
          //   child: BlocBuilder<CounterCubit, int>(
          //     builder: (context, state) {
          //       log('builder');
          //       return Text(
          //         'Home $state',
          //         style: TextStyle(fontSize: 20.sp, color: Colors.black),
          //       );
          //     },
          //   ),
          // ),
          BlocBuilder<GetAdsCubit, GetAdsState>(
            builder: (context, state) {
              if (state is GetAdsLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              if (state is GetAdsError) {
                return Center(
                  child: Text(
                    state.errorMessage,
                    style: TextStyle(fontSize: 25, color: Colors.red),
                  ),
                );
              }
              if (state is GetAdsSuccess) {
                return Center(
                  child: ListView.builder(
                    itemCount: state.services.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Text(
                        'name ${state.services[index].name}',
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      );
                    },
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
