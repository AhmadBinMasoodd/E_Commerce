import 'package:e_commerce/common/widgets/screens/success_screen.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/styles/padding.dart';
import '../../../../common/widgets/button/elevated_button.dart';
import '../../../../utils/constants/Sizes.dart';
import '../../../../utils/constants/text.dart';
import '../../../../utils/helpers/device_helpers.dart';
import '../login/login.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => LoginScreen()),
            icon: Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              ///Image
              Image.asset(
                UImages.mainSentImage,
                height: UDeviceHelpers.getScreenWidth(context) * 0.6,
              ),
              SizedBox(height: USizes.spaceBtwItems),

              Text(
                UTexts.verifyEmailTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: USizes.spaceBtwItems),

              Text(
                'Unknown@gmail.com',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: USizes.spaceBtwItems),

              Text(
                UTexts.verifyEmailSubtitle,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: USizes.spaceBtwSections),
              UElevatedButton(
                onPressed: () => Get.to(
                  () => SuccessScreen(
                    image: UImages.accountCreatedImage,
                    title: UTexts.accountCreatedTitle,
                    subtitle: UTexts.accountCreatedSubtitle,
                  ),
                ),
                child: Text(UTexts.vContinue),
              ),
              SizedBox(height: USizes.spaceBtwItems),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: Text(UTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
