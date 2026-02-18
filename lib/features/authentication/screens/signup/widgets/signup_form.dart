import 'package:e_commerce/features/authentication/controllers/signup/signup_controller.dart';
import 'package:e_commerce/features/authentication/screens/signup/widgets/privacy_policy_checkbox.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/button/elevated_button.dart';
import '../../../../../utils/constants/Sizes.dart';
import '../../../../../utils/constants/text.dart';

class USignupForm extends StatelessWidget {
  const USignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          ///Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      UValidator.validateEmptyText('First Name', value),
                  decoration: InputDecoration(
                    labelText: UTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              SizedBox(width: USizes.spaceBtwInputFields),
              //last name
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,

                  validator: (value) =>
                      UValidator.validateEmptyText('Last Name', value),
                  decoration: InputDecoration(
                    labelText: UTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: USizes.spaceBtwInputFields),

          ///email
          TextFormField(
            controller: controller.email,

            validator: (value) => UValidator.validateEmail(value),
            decoration: InputDecoration(
              labelText: UTexts.email,
              prefixIcon: Icon(Iconsax.direct_right),
            ),
          ),
          SizedBox(height: USizes.spaceBtwInputFields),

          ///password
          TextFormField(
            validator: (value) => UValidator.validatePhoneNumber(value),
            controller: controller.phoneNumber,

            decoration: InputDecoration(
              labelText: UTexts.phoneNumber,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          SizedBox(height: USizes.spaceBtwInputFields),

          Obx(
            () => TextFormField(
              obscureText: controller.isPasswordVisible.value,
              validator: (value) => UValidator.validatePassword(value),
              controller: controller.password,
              decoration: InputDecoration(
                labelText: UTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.isPasswordVisible.value =
                      !controller.isPasswordVisible.value,
                  icon: Icon(
                    controller.isPasswordVisible.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: USizes.spaceBtwInputFields / 2),

          ///Check box  and privacy policy
          PrivacyPolicyCheckBox(),
          SizedBox(height: USizes.spaceBtwItems),

          ///create account button
          UElevatedButton(
            onPressed: controller.registerUser,
            child: Text(UTexts.createAccount),
          ),
        ],
      ),
    );
  }
}
