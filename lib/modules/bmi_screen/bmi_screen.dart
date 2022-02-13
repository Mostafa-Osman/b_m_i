import 'dart:math';
import 'package:b_m_i/modules/bmi_result_screen/bmi_result_screen.dart';
import 'package:b_m_i/shared/components/components.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true;
  double height = 120;
  int weight = 40;
  int age = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          // first column
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage(
                              'assets/images/male.png',
                            ),
                            height: 90,
                            width: 90,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          defaultText(text: 'Male')
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isMale ? Colors.green : Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage(
                              'assets/images/female.png',
                            ),
                            height: 90,
                            width: 90,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          defaultText(text: 'Female')
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: !isMale ? Colors.lightGreen : Colors.grey[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
          // second column

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    defaultText(text: 'HEIGHT'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        defaultText(
                            text: "${height.round()}",
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900),
                        defaultText(text: 'cm', fontSize: 20.0),
                      ],
                    ),
                    Slider(
                        value: height,
                        min: 80.0,
                        max: 220,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        })
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),

          // third column
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        defaultText(text: 'WEIGHT'),
                        SizedBox(
                          height: 15,
                        ),
                        defaultText(text: '${weight}', fontSize: 40),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              heroTag: 'weight-',
                              child: Icon(Icons.remove),
                              mini: true,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              heroTag: 'weight+',
                              child: Icon(Icons.add),
                              mini: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[400],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        defaultText(text: 'AGE'),
                        SizedBox(
                          height: 15,
                        ),
                        defaultText(text: "${age}", fontSize: 40),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              heroTag: 'age-',
                              child: Icon(Icons.remove),
                              mini: true,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              heroTag: 'age+',
                              child: Icon(Icons.add),
                              mini: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ],
            ),
          )),
          defaultButton(
            text: 'CALCULATE',
            backgroundColor: Colors.red,
            radius: 15.0,
            function: () {
              var res = weight / pow(height / 100, 2);
              String gender;
              gender = isMale ? 'Male' : 'Female';
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BmiResultScreen(
                          gender: gender, age: age, result: res.round())));
            },
          ),
        ],
      ),
    );
  }
}
