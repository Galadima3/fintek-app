import 'package:fintek/main.dart';
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
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 1);
                });
              },
              children: const [
                Slide1(),
                Slide2(),
              ],
            ),
            Container(
              alignment: const Alignment(0, 0.75),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(controller: _controller, count: 2),
                    onLastPage
                        ? GestureDetector(
                            onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) {
                               return const MyHomePage(title: 'Ozai');
                             },));
                            },
                            child: const FancyButton(text: 'Done'),
                          )
                        : GestureDetector(
                            onTap: () {
                              _controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            child: const FancyButton(text: 'Next'),
                          ),
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

class FancyButton extends StatelessWidget {
  final String text;
  const FancyButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 75,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
