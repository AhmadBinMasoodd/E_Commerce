import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
            prefixIcon: Icon(Iconsax.direct_right),
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
              onPressed: () {},
              child: Text(UTexts.forgetPassword),
            ),
          ],
        ),
        SizedBox(height: USizes.spaceBtwSections),

        ///sign in
        UElevatedButton(onPressed: () {}, child: Text(UTexts.signIn)),
        SizedBox(height: USizes.spaceBtwItems / 2),

        ///create account
        UElevatedButton(onPressed: () {}, child: Text(UTexts.createAccount)),
      ],
    );
  }
}
