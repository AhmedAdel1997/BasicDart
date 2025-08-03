import 'package:flutter/material.dart';

class RowTest extends StatelessWidget {
  const RowTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Row Test')),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(height: 100, width: 100, color: Colors.red),
                Container(height: 100, width: 100, color: Colors.blue),
                Container(height: 100, width: 100, color: Colors.green),
                Container(height: 100, width: 100, color: Colors.yellow),
                Container(height: 100, width: 100, color: Colors.purple),
              ],
            ),
          ),
          SizedBox(height: 100),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              Container(height: 100, width: 100, color: Colors.red),
              Container(height: 100, width: 100, color: Colors.blue),
              Container(height: 100, width: 100, color: Colors.green),
              Container(height: 100, width: 100, color: Colors.yellow),
              Container(height: 100, width: 100, color: Colors.purple),
              Container(height: 100, width: 100, color: Colors.red),
              Container(height: 100, width: 100, color: Colors.blue),
              Container(height: 100, width: 100, color: Colors.green),
              Container(height: 100, width: 100, color: Colors.yellow),
              Container(height: 100, width: 100, color: Colors.purple),
              Container(height: 100, width: 100, color: Colors.red),
              Container(height: 100, width: 100, color: Colors.blue),
            ],
          ),
        ],
      ),
    );
  }
}
