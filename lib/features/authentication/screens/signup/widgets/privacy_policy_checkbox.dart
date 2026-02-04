import 'package:e_commerce/utils/helpers/helpers_function.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text.dart';

class PrivacyPolicyCheckBox extends StatelessWidget {
  const PrivacyPolicyCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark=UHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Checkbox(value: false, onChanged: (value) {}),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(text: " ${UTexts.iAgreeTo}"),
              TextSpan(
                text: " ${UTexts.privacyPolicy}",
                style: Theme.of(context).textTheme.bodyMedium!
                    .copyWith(
                    color:isDark? UColors.white: UColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor:isDark? UColors.white: UColors.primary
                ),
              ),
              TextSpan(text: " ${UTexts.and}"),
              TextSpan(text: " ${UTexts.termOfUse}",
                style: Theme.of(context).textTheme.bodyMedium!
                    .copyWith(
                    color:isDark? UColors.white: UColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor:isDark? UColors.white: UColors.primary
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
