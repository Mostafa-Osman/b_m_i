import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  final gender;
  final age;
  final result;

  const BmiResultScreen(
      {required this.gender, required this.age, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Result Screen"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Gender:${gender}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
              Text("Result:${result}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
              Text("Age:${age}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
            ],
          ),
        ));
  }
}
