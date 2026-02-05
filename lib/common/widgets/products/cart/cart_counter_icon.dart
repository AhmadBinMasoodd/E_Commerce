import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helpers_function.dart';

class UCartCounterIcon extends StatelessWidget {
  const UCartCounterIcon({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    bool isDark = UHelperFunctions.isDarkMode(context);

    return Stack(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Iconsax.shopping_bag, color: UColors.white),
        ),

        Positioned(
          right: 6.0,

          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              color: isDark ? UColors.white : UColors.dark,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context).textTheme.labelLarge!.apply(
                  fontSizeFactor: 0.8,
                  color: isDark ? UColors.dark : UColors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
