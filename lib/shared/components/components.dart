import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  double height = 40.0,
  Color backgroundColor = Colors.blue,
  double radius = 3.0,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: () => function(),
        child:
            defaultText(text: text, textColor: Colors.cyanAccent, fontSize: 20),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
    );

Widget defaultText(
        {required String text,
        double fontSize = 25,
        FontWeight fontWeight = FontWeight.bold,
        Color textColor = Colors.white}) =>
    Text(
      text,
      style: TextStyle(
          fontSize: fontSize, fontWeight: fontWeight, color: textColor),
    );
