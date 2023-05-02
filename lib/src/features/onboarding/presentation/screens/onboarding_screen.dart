
import 'package:fintek/src/features/account/presentation/screens/home_screen.dart';
import 'package:fintek/src/features/onboarding/presentation/screens/onboarding_slide.dart';
import 'package:fintek/src/features/onboarding/presentation/widgets/onboarding_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
                OnboardingSlide(screenText: 'Get involved in your Saving and Grow'),
                OnboardingSlide(screenText: 'Financial Stability Guaranteed'),
              ],
            ),
            Container(
              alignment: const Alignment(0, 0.75),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 2,
                     effect: const WormEffect(
                        spacing: 14.5,
                        dotColor: Colors.white38,
                        activeDotColor: Colors.white),
                    onDotClicked: (index) => _controller.animateToPage(index,
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeIn),
                    ),
                    onLastPage
                        ? GestureDetector(
                            onTap: () async {
                              final navigator = Navigator.of(context);
                              final prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setBool('showHome', true);
                              navigator
                                  .push(MaterialPageRoute(builder: (context) {
                                return const HomeScreen(title: 'Ozai');
                              }));
                            },
                            child: const OnboardingButton(text: 'Done'),
                          )
                        : GestureDetector(
                            onTap: () {
                              _controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            child: const OnboardingButton(text: 'Next'),
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




// effect: WormEffect(
//                         spacing: 16,
//                         dotColor: Colors.white38,
//                         activeDotColor: Colors.white),
//                     onDotClicked: (index) => _controller.animateToPage(index,
//                         duration: Duration(milliseconds: 500),
//                         curve: Curves.easeIn),