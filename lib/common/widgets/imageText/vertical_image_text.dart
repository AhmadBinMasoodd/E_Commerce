import 'package:flutter/material.dart';

import '../../../utils/constants/Sizes.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helpers_function.dart';
import '../custom_shapes/circular_container.dart';

class UVerticalImageText extends StatelessWidget {
  const UVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    required this.textColor,
    this.backGroundColor,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backGroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    bool dark=UHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          UCircularContainer(
            height: 56,
            width: 56,
            backgroundColor: backGroundColor ?? (dark?UColors.dark : UColors.white),
            padding: EdgeInsets.all(USizes.sm),
            child: Image(image: AssetImage(image), fit: BoxFit.cover,),
          ),
          SizedBox(height: USizes.spaceBtwItems / 2),
          SizedBox(
            width: 55,
            child: Text(
              title,
              style: Theme.of(context).textTheme.labelMedium!.apply(
                overflow: TextOverflow.ellipsis,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
