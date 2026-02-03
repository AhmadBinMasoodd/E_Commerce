import 'package:e_commerce/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/helpers/device_helpers.dart';
class OnBoardingDotNavigator extends StatelessWidget {
  const OnBoardingDotNavigator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final conntroller=OnBoardingController.instance;
    return Positioned(
      bottom: UDeviceHelpers.getBottomNavigationBarHeight()*4,
      left: UDeviceHelpers.getScreenWidth(context)/3,
      right: UDeviceHelpers.getScreenWidth(context)/3,
      child: SmoothPageIndicator(
        controller: conntroller.pageController,
        onDotClicked: conntroller.dotNavigatorClick,
        count: 3,
        effect:ExpandingDotsEffect(
          dotHeight: 6.0,

        ) ,
      ),
    );
  }
}
