import 'package:e_commerce/common/styles/padding.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/Sizes.dart';
import '../../../utils/constants/text.dart';
import '../../../utils/helpers/device_helpers.dart';
import '../button/elevated_button.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onTap,
  });

  final String title, subtitle, image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [

              //image
              Image.asset(
                image,
                height: UDeviceHelpers.getScreenWidth(context) * 0.6,
              ),
              SizedBox(height: USizes.spaceBtwItems),
              ///title
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: USizes.spaceBtwItems),
              ///subtitle
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: USizes.spaceBtwSections),
              ///continue
              UElevatedButton(
                onPressed: onTap,
                child: Text(UTexts.vContinue),
              ),
              SizedBox(height: USizes.spaceBtwItems),

              // SizedBox(
              //   width: double.infinity,
              //   child: TextButton(
              //     onPressed: () {},
              //     child: Text(UTexts.resendEmail),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
