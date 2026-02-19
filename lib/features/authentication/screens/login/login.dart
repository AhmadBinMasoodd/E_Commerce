import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/login_signup/form_devider.dart';
import 'package:e_commerce/features/authentication/controllers/login/login_controller.dart';
import 'package:e_commerce/features/authentication/screens/login/widgets/header.dart';
import 'package:e_commerce/features/authentication/screens/login/widgets/login_form.dart';
import 'package:e_commerce/common/widgets/login_signup/social_button.dart';
import 'package:e_commerce/utils/constants/Sizes.dart';
import 'package:e_commerce/utils/constants/text.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //////////header
              UloginHeader(),
              SizedBox(height: USizes.spaceBtwSections),
              /////////form
              ULoginForm(),
        
              SizedBox(height: USizes.spaceBtwSections),
              //////////devider
              UFormDevider(text: UTexts.orSignInWith,),
              SizedBox(height: USizes.spaceBtwSections),
        
              /////////footer
              USocialButton()
            ],
          ),
        ),
      ),
    );
  }
}




