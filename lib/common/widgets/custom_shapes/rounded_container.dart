import 'package:flutter/material.dart';

import '../../../utils/constants/Sizes.dart';
import '../../../utils/constants/colors.dart';

class URoundedContainer extends StatelessWidget {
  const URoundedContainer({super.key,
    this.width,
    this.height,
    this.radius=USizes.cardRadiusLg,
    this.child,
    this.showBorder=false,
    this.borderColor=UColors.borderPrimary,
    this.backgroundColor=UColors.white,
    this.padding,
     this.margin=const EdgeInsets.all(16)
  });
  final double? width,height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor,backgroundColor;
  final EdgeInsetsGeometry? padding,margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: height,
      margin: margin,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder? Border.all(color: borderColor):null,
      ),
      child: child,
    );
  }
}
