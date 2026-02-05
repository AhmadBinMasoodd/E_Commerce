import 'package:e_commerce/common/styles/shadow.dart';
import 'package:e_commerce/utils/helpers/helpers_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/Sizes.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/text.dart';

class USearchedBar extends StatelessWidget {
  const USearchedBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark=UHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: 0,
      left: USizes.spaceBtwSections,
      right: USizes.spaceBtwSections,
      child: Container(
        height: USizes.searchBarHeight,
        padding: EdgeInsets.symmetric(horizontal: USizes.md),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(USizes.borderRadiusLg),
          color:isDark? UColors.dark: UColors.white,
          boxShadow:UShadow.searchBarShadow,
        ),
        child: Row(
          children: [
            Icon(Iconsax.search_normal, color: UColors.darkGrey),
            SizedBox(width: USizes.spaceBtwItems),
            Text(
              UTexts.homeAppbarSearchbarTitle,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
