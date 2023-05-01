import 'package:fintek/src/core/constants.dart';
import 'package:flutter/material.dart';

class OnboardingSlide extends StatelessWidget {
  final String screenText;

  const OnboardingSlide({super.key, required this.screenText});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
       Container(
        padding: const EdgeInsets.all(5),
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(onboardingImage), fit: BoxFit.cover),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(5),
        alignment: const Alignment(0, -0.75),
        child: Text(
          textAlign: TextAlign.start,
          screenText,
          style: const TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )
    ])));
  }
}
