import 'package:e_commerce/features/authentication/screens/onboarding/widgets/onboardingPage.dart';
import 'package:e_commerce/utils/constants/Sizes.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/text.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [

              Onboardingpage(title: UTexts.onBoardingText1, subtitle: UTexts.onboardingSubtitle1, animation: UImages.onboarding1Animation),
              Onboardingpage(title: UTexts.onBoardingText1, subtitle: UTexts.onboardingSubtitle1, animation: UImages.onboarding1Animation),
              Onboardingpage(title: UTexts.onBoardingText1, subtitle: UTexts.onboardingSubtitle1, animation: UImages.onboarding1Animation),

            ],
          )
        ],
      ),
    );
  }
}
