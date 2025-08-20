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

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

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
    context.read<GetAdsCubit>().getAds();
  }

  // int counter = 0;
  @override
  Widget build(BuildContext context) {
    log('build');
    // final counterCubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<GetOrdersCubit>().getOrders(status: 'approved');
        },

        backgroundColor: Colors.indigo,
        child: Icon(Icons.get_app, color: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
                //PageView.builder
                return CarouselSlider(
                  options: CarouselOptions(
                    height: 400,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  ),
                  items:
                      state.ads.map((adModel) {
                        return Builder(
                          builder: (BuildContext context) {
                            return GestureDetector(
                              onTap: () async {
                                final url = adModel.url;
                                //parsing url to Uri

                                if (url.isNotEmpty &&
                                    url.startsWith('https') &&
                                    await canLaunchUrl(Uri.parse(url))) {
                                  launchUrl(Uri.parse(url));
                                } else {
                                  Fluttertoast.showToast(msg: 'Invalid url');
                                }
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.network(adModel.image),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black45,
                                    ),
                                    child: Text(
                                      adModel.title,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }).toList(),
                  // items: List.generate(state.ads.length, (index) {
                  //   return Image.network(state.ads[index].image);
                  // }),
                );
              }
              return SizedBox();
            },
          ),

          // TextButton(
          //   onPressed: () async {
          //     final url = 'tel:+201061312432';
          //     if (await canLaunchUrl(Uri.parse(url))) {
          //       await launchUrl(Uri.parse(url));
          //     } else {
          //       Fluttertoast.showToast(msg: 'Invalid Phone number');
          //     }
          //   },
          //   child: Text('Call +201061312432'),
          // ),
          TextButton(
            onPressed: () async {
              final url = 'mailto:ahmedadelhabita@gmail.com';
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url));
              } else {
                Fluttertoast.showToast(msg: 'Invalid Mail');
              }
            },
            child: Text('Mail to ahmedadelhabita@gmail.com'),
          ),

          // BlocBuilder<GetServicesCubit, GetServicesState>(
          //   builder: (context, state) {
          //     if (state is GetServicesLoading) {
          //       return const Center(
          //         child: CircularProgressIndicator.adaptive(),
          //       );
          //     }
          //     if (state is GetServicesError) {
          //       return Center(
          //         child: Text(
          //           state.errorMessage,
          //           style: TextStyle(fontSize: 25, color: Colors.red),
          //         ),
          //       );
          //     }
          //     if (state is GetServicesSuccess) {
          //       return Center(
          //         child: ListView.builder(
          //           itemCount: state.services.length,
          //           shrinkWrap: true,
          //           itemBuilder: (context, index) {
          //             return Text(
          //               'name ${state.services[index].name}',
          //               style: TextStyle(fontSize: 25, color: Colors.black),
          //             );
          //           },
          //         ),
          //       );
          //     }
          //     return const SizedBox.shrink();
          //   },
          // ),
        ],
      ),
    );
  }
}
