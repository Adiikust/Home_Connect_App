import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';
import 'package:vendor_app/Views/Widgets/text_button.dart';
import '../Widgets/on_boarding_pages_data.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Column(
                    children: [
                      Image.asset(contents[i].image.toString()),
                      BuildText(
                        text: contents[i].title.toString(),
                        size: 26,
                        fontWeight: FontWeight.bold,
                        family: 'Montserrat-SemiBold',
                        color: AppColors.kTextColor1,
                      ),
                      BuildSizeBox(
                          height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          contents[i].discription.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 15,
                              color: AppColors.kTextColor2,
                              fontFamily: 'Montserrat-Regular'),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextBottun(
                text: currentIndex == contents.length - 1 ? "Continue" : "Next",
                clickCallback: () {
                  if (currentIndex == contents.length - 1) {
                    Get.to(const LoginScreen());
                  }
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceIn,
                  );
                },
              ),
            ),
            BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  contents.length,
                  (index) => buildDot(index, context),
                ),
              ),
            ),
            BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index
            ? AppColors.kGreenColor
            : AppColors.kDArkBlackColor,
      ),
    );
  }
}
