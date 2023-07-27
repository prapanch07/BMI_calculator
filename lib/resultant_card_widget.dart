import 'package:flutter/material.dart';

import 'colors.dart';

class ResultantCardWidget extends StatelessWidget {
  final Color color;
  final Color fontcolor;
  final bmi;
  final praise;
  final string;

  const ResultantCardWidget({
    super.key,
    required this.color,
    required this.bmi,
    required this.praise,
    required this.string,
    required this.fontcolor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: MediaQuery.sizeOf(context).width,
      child: Card(
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BMI: $bmi ',
                style: const TextStyle(
                    color: whitecolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Text(
                praise,
                style: TextStyle(color: fontcolor, fontWeight: FontWeight.bold),
              ),
              Text(
                string,
                style: TextStyle(
                  color: fontcolor,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
