import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/Sizes.dart';
import '../../../utils/constants/text.dart';
import '../../../utils/helpers/device_helpers.dart';
import '../button/elevated_button.dart';
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.title, required this.subtitle, required this.image});
  final String title,subtitle,image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: UPadding.screenPadding,child: Column(
          children: [
            Image.asset(
              image,
              height: UDeviceHelpers.getScreenWidth(context) * 0.6,
            ),
            SizedBox(height: USizes.spaceBtwItems),

            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: USizes.spaceBtwItems),


            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: USizes.spaceBtwSections),
            UElevatedButton(onPressed: ()=>Get.to(()=>LoginScreen()), child: Text(UTexts.vContinue)),
            SizedBox(height: USizes.spaceBtwItems),

            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                child: Text(UTexts.resendEmail),
              ),
            ),
          ],
        ),),
      ),
    );
  }
}
