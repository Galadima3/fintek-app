import 'package:fintek/src/features/onboarding/presentation/screens/slide_1.dart';
import 'package:fintek/src/features/onboarding/presentation/screens/slide_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              children: const [
                Slide1(),
                Slide2(),
              ],
            ),
            Container(
              alignment: const Alignment(0, 0.75),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 2
                    ),
                    Container(
                      height: 35,
                      width: 65,
                      color: Colors.black,
                      
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
