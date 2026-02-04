import 'package:e_commerce/features/authentication/screens/onboarding/widgets/onboardingPage.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/widgets/onboarding_dot_navigator.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:e_commerce/utils/constants/Sizes.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/onboarding/onboarding_controller.dart';
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(OnBoardingController());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
        child: Stack(
          children: [
            PageView(
              controller:controller.pageController ,
              onPageChanged: controller.updatePageIndicator,
              children: [
                OnboardingPage(
                  title: UTexts.onBoardingText1,
                  subtitle: UTexts.onboardingSubtitle1,
                  animation: UImages.onboarding1Animation,
                ),
                OnboardingPage(
                  title: UTexts.onBoardingText2,
                  subtitle: UTexts.onboardingSubtitle2,
                  animation: UImages.onboarding2Animation,
                ),
                OnboardingPage(
                  title: UTexts.onBoardingText3,
                  subtitle: UTexts.onboardingSubtitle3,
                  animation: UImages.onboarding3Animation,
                ),
              ],
            ),

            OnBoardingDotNavigator(),

            OnboardingNextButton(),

            OnboardingSkipButton()
          ],
        ),
      ),
    );
  }
}



