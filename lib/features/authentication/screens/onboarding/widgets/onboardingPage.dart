import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



class OnboardingPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String animation;
   const OnboardingPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top:UDeviceHelpers.getAppBarHeight()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(animation),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
