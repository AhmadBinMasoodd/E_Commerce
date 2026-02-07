
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helpers_function.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/Sizes.dart';

class UCircularIcon extends StatelessWidget {
  const UCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size=USizes.iconMd,
    required this.icon,
    this.backgroundColor,
    this.color,
     this.onPressed,
  });

  final double? width, height, size;
  final IconData? icon;
  final Color? backgroundColor, color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: (backgroundColor != null)
              ? backgroundColor
              : dark
              ? UColors.dark.withValues(alpha: 0.9)
              : UColors.light.withValues(alpha: 0.9),

        ),
        child: IconButton(
            onPressed: onPressed, icon: Icon(icon, color: color, size: size,)),

    );
  }
}
