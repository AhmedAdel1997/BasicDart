import 'package:flutter/material.dart';

class StackText extends StatelessWidget {
  const StackText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Stack Test')),
      body: Stack(
        children: [
          Container(height: 300, width: 300, color: Colors.white),
          Positioned(
            top: 0,
            right: 0,
            child: Container(height: 200, width: 200, color: Colors.blue),
          ),
          Positioned(
            bottom: 50,
            left: 50,
            child: Container(height: 100, width: 100, color: Colors.purple),
          ),
        ],
      ),
    );
  }
}
