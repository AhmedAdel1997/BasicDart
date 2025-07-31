import 'package:flutter/material.dart';

class ColumnTest extends StatelessWidget {
  const ColumnTest({super.key});

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
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 3),
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
                padding: EdgeInsets.all(50), //padding is inside the container
                // margin: EdgeInsets.all(50), //margin is outside the container
                // constraints: BoxConstraints(
                //   maxWidth: 400,
                //   maxHeight: 400,
                //   minWidth: 100,
                //   minHeight: 100,
                // ),
                child: Text('Hello'),
              ),

              Container(height: 200, width: 200, color: Colors.red),
              Container(height: 200, width: 200, color: Colors.blue),
              Container(height: 200, width: 200, color: Colors.red),
              Container(height: 200, width: 200, color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}
