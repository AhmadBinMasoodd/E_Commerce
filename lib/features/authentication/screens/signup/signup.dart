import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/login_signup/form_devider.dart';
import 'package:e_commerce/common/widgets/login_signup/social_button.dart';
import 'package:e_commerce/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:e_commerce/utils/constants/Sizes.dart';
import 'package:e_commerce/utils/constants/text.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              ///header
              Text(
                UTexts.signUnTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: USizes.spaceBtwSections),

              ///form
              USignupForm(),
              SizedBox(height: USizes.spaceBtwSections),

              ///divider
              UFormDevider(text: UTexts.orSignUpWith),
              SizedBox(height: USizes.spaceBtwSections),

              ///footer
              USocialButton()
            ],
          ),
        ),
      ),
    );
  }
}

