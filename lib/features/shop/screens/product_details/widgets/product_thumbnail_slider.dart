import 'package:e_commerce/utils/helpers/helpers_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/Sizes.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images.dart';
class UThumbnailAndSlider extends StatelessWidget {
  const UThumbnailAndSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final bool dark=UHelperFunctions.isDarkMode(context);
    return Container(
      color: dark ? UColors.dark : UColors.light,
      child: Stack(
        children: [
          ///  main image thumbnail
          SizedBox(
            height: 300,
            child: Padding(
              padding: EdgeInsets.all(USizes.productImageRadius * 2),
              child: Center(
                child: Image(image: AssetImage(UImages.productImage7)),
              ),
            ),
          ),

          ///image slider
          Positioned(
            right: 0,
            bottom: 30,
            left: USizes.defaultSpace,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    SizedBox(width: USizes.spaceBtwItems),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) => URoundedImage(
                  width: 80,
                  backgroundColor: dark ? UColors.dark : UColors.light,
                  padding: EdgeInsets.all(USizes.sm),
                  border: Border.all(color: UColors.primary),
                  imageUrl: UImages.productImage2,
                ),
              ),
            ),
          ),
          //app bar back error with favorite icon
          UAppBar(
            showBackArrow: true,
            actions: [
              UCircularIcon(icon: Iconsax.heart, color: Colors.red),
            ],
          ),
        ],
      ),
    );
  }
}
