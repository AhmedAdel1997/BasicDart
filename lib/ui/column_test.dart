import 'dart:developer';
import 'dart:io';

import 'package:dratbasics/core/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../core/colors.dart';

class ColumnTest extends StatefulWidget {
  const ColumnTest({super.key});

  @override
  State<ColumnTest> createState() => _ColumnTestState();
}

class _ColumnTestState extends State<ColumnTest> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,

        title: Text('Design Test'),
        centerTitle: true,
        leading: Text('leading'),
        actions: [Text('actions'), SizedBox(width: 10), Text('actions')],
        leadingWidth: 100,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            Center(
              child: Container(
                height: 56.h,
                width: 382.w,
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.w),
              child: Container(
                height: 250.h,
                // width: 250.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100.r),
                  border: Border.all(color: Colors.black, width: 3.w),
                  //linear gradient
                  // gradient: RadialGradient(
                  //   colors: [Colors.red, Colors.blue],
                  //   radius: 0.1,
                  // ),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black,
                  //     blurRadius: 50,
                  //     offset: Offset(30, 30),
                  //     spreadRadius: 30,
                  //   ),
                  // ],
                ),
                padding: EdgeInsets.all(50.h), //padding is inside the container
                // margin: EdgeInsets.all(50), //margin is outside the container
                // constraints: BoxConstraints(
                //   maxWidth: 400,
                //   maxHeight: 400,
                //   minWidth: 100,
                //   minHeight: 100,
                // ),
                child: Column(
                  children: [
                    Text('احمد', style: AppTextStyle.titleBold),
                    SizedBox(height: 10.h),
                    Text(
                      'محمد',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Container(height: 200, width: 200, color: Colors.red),
            // Container(height: 200, width: 200, color: Colors.blue),
            // Container(height: 200, width: 200, color: Colors.red),
            // Container(height: 200, width: 200, color: Colors.blue),
            // Container(height: 200, width: 200, color: AppColors.primary),
            // SizedBox(height: 20),
            // Container(height: 200, width: 200, color: AppColors.secondary),
            Image.asset('assets/images/user_image.png'),

            // Image.asset('assets/images/china.png', height: 100, width: 100),
            Image.network(
              'https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?_gl=1*180xlyr*_ga*MTk1OTEyOTk2Mi4xNzU0Mjk5NDI1*_ga_8JE65Q40S6*czE3NTQyOTk0MjQkbzEkZzEkdDE3NTQyOTk0MjkkajU1JGwwJGgw',
              height: 100,
              width: 200,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 20),

            if (image != null) Image.file(image!),

            TextButton(
              onPressed: () async {
                final imagePicker = ImagePicker();
                final image = await imagePicker.pickImage(
                  source: ImageSource.camera,
                );
                if (image != null) {
                  log(image.path);
                  setState(() {
                    this.image = File(image.path);
                  });
                }
              },
              child: Text('pick image', style: TextStyle(fontSize: 25)),
            ),
          ],
        ),
      ),
    );
  }
}
