import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/Sizes.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helpers_function.dart';
import '../../icons/circular_icon.dart';

class UProductQuantityWithAddRemove extends StatelessWidget {
  const UProductQuantityWithAddRemove({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        ///increment button
        UCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: USizes.iconSm,
          color: dark ? UColors.white : UColors.black,
          backgroundColor: dark
              ? UColors.darkerGrey
              : UColors.light,
        ),
        SizedBox(width: USizes.spaceBtwItems),

        ///counter text
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        SizedBox(width: USizes.spaceBtwItems),
        ///decrement button
        UCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: USizes.iconSm,
          color: UColors.white,
          backgroundColor: UColors.primary,
        ),

      ],
    );
  }
}
