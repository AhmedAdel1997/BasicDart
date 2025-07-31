import 'dart:developer';

import 'package:flutter/material.dart';

class ButtonsTest extends StatefulWidget {
  const ButtonsTest({super.key});

  @override
  State<ButtonsTest> createState() => _ButtonsTestState();
}

class _ButtonsTestState extends State<ButtonsTest> {
  bool isChecked = false;
  String isRadio = 'A';
  bool isSwitch = false;
  double sliderValue = 0.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buttons Test')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                log('Text Button Pressed');
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: Text('Text Button', style: TextStyle(fontSize: 20)),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                log('Elevated Button Pressed');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                elevation: 10,
              ),
              child: Text('Elevated Button', style: TextStyle(fontSize: 20)),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                log('Outlined Button Pressed');
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: Text('Outlined Button', style: TextStyle(fontSize: 20)),
            ),
            SizedBox(height: 10),
            IconButton(onPressed: () {}, icon: Icon(Icons.add), iconSize: 40),
            SizedBox(height: 10),

            GestureDetector(
              onTap: () {
                log('outside Pressed');
              },

              child: Container(
                height: 100,
                width: 100,
                color: Colors.red,
                padding: EdgeInsets.all(30),
                child: GestureDetector(
                  onTap: () {
                    log('inside Pressed');
                  },
                  child: Container(height: 40, width: 40, color: Colors.blue),
                ),
              ),
            ),

            Checkbox(
              value: isChecked,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    isChecked = value;
                  });
                }
              },
            ),
            Radio<String>(
              value: isRadio,
              groupValue: isRadio,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    isRadio = value;
                  });
                }
              },
            ),
            Radio<String>(
              value: isRadio,
              groupValue: isRadio,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    isRadio = value;
                  });
                }
              },
            ),
            Switch(
              value: isSwitch,
              onChanged: (value) {
                setState(() {
                  isSwitch = value;
                });
              },
            ),

            Slider(
              value: sliderValue,
              min: 0,
              max: 10000,
              divisions: 10,
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });

                log('Slider Value: $sliderValue');
              },
            ),
          ],
        ),
      ),
    );
  }
}
