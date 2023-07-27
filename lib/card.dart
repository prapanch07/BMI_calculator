import 'package:bmi_calculator/colors.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final height;
  final weight;
  const CardWidget({super.key, required this.height, required this.weight});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: 150,
      width: _size.width,
      child: Card(
        elevation: 5,
        color: cyancolor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Height: $height cm',
              style: const TextStyle(
                color: whitecolor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Weight: $weight kg',
              style: const TextStyle(
                  color: whitecolor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
