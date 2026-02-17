import 'package:e_commerce/features/authentication/controllers/signup/signup_controller.dart';
import 'package:e_commerce/utils/helpers/helpers_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text.dart';

class PrivacyPolicyCheckBox extends StatelessWidget {
  const PrivacyPolicyCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = UHelperFunctions.isDarkMode(context);
    final controller = SignUpController.instance;
    return Row(
      children: [
        Obx(
          () => Checkbox(
            value: controller.privacyPolicy.value,
            onChanged: (value) => controller.privacyPolicy.value =
                !controller.privacyPolicy.value,
          ),
        ),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(text: " ${UTexts.iAgreeTo}"),
              TextSpan(
                text: " ${UTexts.privacyPolicy}",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: isDark ? UColors.white : UColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: isDark ? UColors.white : UColors.primary,
                ),
              ),
              TextSpan(text: " ${UTexts.and}"),
              TextSpan(
                text: " ${UTexts.termOfUse}",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: isDark ? UColors.white : UColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: isDark ? UColors.white : UColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
