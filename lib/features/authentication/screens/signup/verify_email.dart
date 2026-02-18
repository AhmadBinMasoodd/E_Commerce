import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/styles/padding.dart';
import '../../../../common/widgets/button/elevated_button.dart';
import '../../../../utils/constants/Sizes.dart';
import '../../../../utils/constants/text.dart';
import '../../../../utils/helpers/device_helpers.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: AuthenticationRepository.instance.logout,
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
                email?? " ",
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
                onPressed: controller.checkEmailVerificationStatus,
                child: Text(UTexts.vContinue),
              ),
              SizedBox(height: USizes.spaceBtwItems),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: controller.sentEmailVerification,
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
