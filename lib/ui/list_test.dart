import 'package:flutter/material.dart';

class ListTest extends StatelessWidget {
  const ListTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Test')),
      // body: ListView(
      //   children: [
      //     Container(height: 200, width: 200, color: Colors.red),
      //     Container(height: 200, width: 200, color: Colors.blue),
      //     Container(height: 200, width: 200, color: Colors.red),
      //     Container(height: 200, width: 200, color: Colors.blue),
      //     Container(height: 200, width: 200, color: Colors.red),
      //     Container(height: 200, width: 200, color: Colors.blue),
      //     Container(height: 200, width: 200, color: Colors.red),
      //     Container(height: 200, width: 200, color: Colors.blue),
      //     Container(height: 200, width: 200, color: Colors.red),
      //     Container(height: 200, width: 200, color: Colors.blue),
      //   ],
      // ),
      body: Column(
        children: [
          Text('Ahmed'),
          SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  width: 200,
                  color: index.isEven ? Colors.red : Colors.blue,
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                  color: index.isEven ? Colors.black : Colors.yellow,
                  height: 10,
                  width: double.infinity,
                );
              },
            ),
          ),
          SizedBox(height: 10),
          Text('Ahmed'),
          SizedBox(height: 10),
        ],
      ),
      // body: GridView.builder(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     mainAxisSpacing: 10,
      //     crossAxisSpacing: 10,
      //     childAspectRatio: 2,
      //   ),
      //   itemCount: 10,
      //   itemBuilder: (context, index) {
      //     return Container(
      //       height: 200,
      //       width: 200,
      //       color: index.isEven ? Colors.red : Colors.blue,
      //     );
      //   },
      // ),
    );
  }
}
