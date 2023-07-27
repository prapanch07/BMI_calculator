import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: const Image(
        filterQuality: FilterQuality.high,
        fit: BoxFit.cover,
        image: AssetImage("assets/bmi-chart.jpg"),
      ),
    );
  }
}
