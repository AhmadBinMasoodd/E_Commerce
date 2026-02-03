import 'package:e_commerce/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/button/elevated_button.dart';
import '../../../../../utils/constants/Sizes.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
      bottom: USizes.spaceBtwItems,
      left: 0,
      right: 0,
      child: UElevatedButton(
        onPressed: controller.nextPage,
        child: Obx(()=>Text(controller.currentIndex.value==2 ? "Get Started":'Next')),
      ),
    );
  }
}
