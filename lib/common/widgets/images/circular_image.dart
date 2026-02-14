import 'package:e_commerce/utils/helpers/helpers_function.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/Sizes.dart';
import '../../../utils/constants/colors.dart';

class UCircularImage extends StatelessWidget {
  const UCircularImage({
    super.key,
    this.boxFit,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = USizes.sm,
    this.showBorder = false,
    this.borderColor = UColors.primary,
    this.borderWidth = 1.0,
  });

  final BoxFit? boxFit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;
  final bool showBorder;
  final Color borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? (dark ? UColors.dark : UColors.light),
        borderRadius: BorderRadius.circular(100),
        border:showBorder? Border.all(color: borderColor, width: borderWidth):null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image(
          image: isNetworkImage
              ? NetworkImage(image)
              : AssetImage(image) as ImageProvider,
          fit: boxFit,
        ),
      ),
    );
  }
}
