import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:transittrack/features/home/presentation/pages/home_page.dart';
import 'package:transittrack/features/onboarding/domain/onboarding_entity.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  List<OnboardingEntity> onboardingItems = [
    OnboardingEntity(
        title: "Real-time tracking",
        image: 'assets/images/onboarding1.jpeg',
        description:
            "Stay connected to your ride always know where your bus is and when it'll be there."),
    OnboardingEntity(
        title: "Arrival time estimation",
        image: 'assets/images/onboarding.png',
        description:
            "Our advanced algorithms provide you with highly accurate arrival time predictions."),
    OnboardingEntity(
        title: "Digital payment",
        image: 'assets/images/onboarding3.png',
        description:
            "Leave the cash at home. Pay for your rides with a simple tap.")
  ];

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();

    return Scaffold(
        backgroundColor: Colors.white,
        bottomSheet: Container(
          color: Colors.white,
          height: 180,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getStarted(context),
                SmoothPageIndicator(
                  controller: pageController,
                  count: onboardingItems.length,
                  onDotClicked: (index) => pageController.animateToPage(index,
                      duration: Duration(microseconds: 600),
                      curve: Curves.easeIn),
                  effect: WormEffect(
                      activeDotColor: Theme.of(context).primaryColor,
                      dotWidth: 10,
                      dotHeight: 10),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          // padding: EdgeInsets.fromLTRB(2.w, 7.h, 2.w, 0.h),
          padding: EdgeInsets.all(12),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: PageView.builder(
                itemCount: onboardingItems.length,
                controller: pageController,
                itemBuilder: (context, index) {
                  return Column(children: [
                    SizedBox(
                      height: 130,
                    ),
                    Image.asset(onboardingItems[index].image),
                    SizedBox(
                      height: 26,
                    ),
                    Text(
                      onboardingItems[index].title,
                      style: TextStyle(fontFamily: 'Laila', fontSize: 32),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: Text(
                        onboardingItems[index].description,
                        style: TextStyle(fontFamily: 'Laila', fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]);
                },
              ),
            ),
          ),
        ));
  }

  Widget getStarted(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final pres = await SharedPreferences.getInstance();
        pres.setBool('onboarding', true);
        
        if (!mounted) return;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      },
      child: Container(
        width: 150,
        height: 65,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Center(
          child: Text('Get Started',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Laila',
                fontSize: 18,
              )),
        ),
      ),
    );
  }
}
