import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/utils/constants/Sizes.dart';
import 'package:e_commerce/utils/constants/text.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReauthenticateUserForm extends StatelessWidget {
  const ReauthenticateUserForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: UAppBar(showBackArrow: true, title: Text('Re-Authenticate User')),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              children: [
                ///email
                TextFormField(
                  controller: controller.email,
                  validator: UValidator.validateEmail,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: UTexts.email,
                  ),
                ),
                SizedBox(height: USizes.spaceBtwInputFields,),

                ///password
                Obx(
                  () => TextFormField(
                    controller: controller.password,
                    obscureText: controller.isPasswordVisible.value,
                    validator: (value) =>
                        UValidator.validateEmptyText('Password', value),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.password_check),
                      labelText: UTexts.password,
                      suffixIcon: IconButton(
                        onPressed: () => controller.isPasswordVisible.value=!controller.isPasswordVisible.value,
                        icon: Icon(controller.isPasswordVisible.value? Iconsax.eye:Iconsax.eye_slash ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: USizes.spaceBtwSections,),

                ///login button
                UElevatedButton(onPressed: controller.reAuthenticateUser, child: Text('Verify')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
