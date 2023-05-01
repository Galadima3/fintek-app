import 'package:fintek/src/core/constants.dart';
import 'package:flutter/material.dart';

class Slide2 extends StatelessWidget {
  const Slide2({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      onboardingImage,
      fit: BoxFit.cover,
    );
  }
}