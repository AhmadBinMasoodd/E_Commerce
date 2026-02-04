import 'package:e_commerce/features/authentication/screens/forget_password/forget_password.dart';
import 'package:e_commerce/features/authentication/screens/signup/signup.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/button/elevated_button.dart';
import '../../../../../utils/constants/Sizes.dart';
import '../../../../../utils/constants/text.dart';
class ULoginForm extends StatelessWidget {
  const ULoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.direct_right),
            labelText: UTexts.email,
          ),
        ),
        SizedBox(height: USizes.spaceBtwInputFields),
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.password_check),
            labelText: UTexts.password,
            suffixIcon: Icon(Iconsax.eye),
          ),
        ),
        SizedBox(height: USizes.spaceBtwInputFields / 2),
        ////Forget password and remember me
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(value: true, onChanged: (value) {}),
                Text(UTexts.rememberMe),
              ],
            ), //remember me
            TextButton(
              onPressed: ()=>Get.to(()=>ForgetPasswordScreen()),
              child: Text(UTexts.forgetPassword),
            ),
          ],
        ),
        SizedBox(height: USizes.spaceBtwSections),

        ///sign in
        UElevatedButton(onPressed: () =>Get.to(()=>NavigationMenu()), child: Text(UTexts.signIn)),
        SizedBox(height: USizes.spaceBtwItems / 2),

        ///create account
        SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () =>Get.to(SignupScreen()), child: Text(UTexts.createAccount))),
      ],
    );
  }
}
