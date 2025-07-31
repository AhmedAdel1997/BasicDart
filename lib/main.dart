import 'package:flutter/material.dart';

import 'ui/text_field.dart';

void main() {
  //entry point of the dart code
  runApp(const MyApp()); //run the application
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const TextFieldTest(),
    );
  }
}
