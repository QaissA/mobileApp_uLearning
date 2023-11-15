import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/pages/welcome/notifier/welcome_notifier.dart';
import 'package:ulearning_app/pages/welcome/view/widgets/widgets.dart';

// final indexProvider = StateProvider<int>((ref) => 0);

class Welcome extends ConsumerWidget {
  Welcome({super.key});

  final PageController _pageController = PageController();
  int dotsIndex=0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexDotProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: EdgeInsets.only(top: 30),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                //Showing our three welcome pages
                PageView(
                  onPageChanged: (value) {
                    ref.read(indexDotProvider.notifier).changeIndex(value);
                  },
                  controller: _pageController,
                  children: [
                    //first page
                    appOnboardingPage(context, _pageController,
                        imagePath: "assets/images/reading.png",
                        title: "First See Learning",
                        subtitle:
                            "Forget about the paper, now Learning all in one place",
                        index: 1),
                    //second page
                    appOnboardingPage(context, _pageController,
                        imagePath: "assets/images/man.png",
                        title: "Connect With Everyone",
                        subtitle:
                            "Always keep in touch with your tutor and friends. Lets get connected",
                        index: 2),
                    //third page
                    appOnboardingPage(context, _pageController,
                        imagePath: "assets/images/boy.png",
                        title: "Always Fascinated Learning",
                        subtitle:
                            "Anywhere, Anytime. the time is at your discretion. So study wherever u can.",
                        index: 3),
                  ],
                ),
                //for showing dots indicator
                Positioned(
                  // left: 100,
                  bottom: 50,
                  child: DotsIndicator(
                    position: index,
                    dotsCount: 3,
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(24.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
