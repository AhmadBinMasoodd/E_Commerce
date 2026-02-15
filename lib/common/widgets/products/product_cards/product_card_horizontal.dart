
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/Sizes.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/helpers/helpers_function.dart';
import '../../custom_shapes/rounded_container.dart';
import '../../icons/circular_icon.dart';
import '../../images/rounded_image.dart';
import '../../texts/brand_title_with_verify_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';
class UProductHorizontal extends StatelessWidget {
  const UProductHorizontal({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          USizes.productImageRadius,
        ),
        color: dark ? UColors.darkerGrey : UColors.light,
      ),
      child: Row(
        children: [

          //left portion
          URoundedContainer(
            height: 150,
            padding: EdgeInsets.all(USizes.sm),
            backgroundColor: dark
                ? UColors.dark
                : UColors.light,
            child: Stack(
              children: [
                ///thumbnail
                SizedBox(
                  width: 120,
                  height: 150,
                  child: URoundedImage(
                    imageUrl: UImages.productImage15,
                  ),
                ),
                //discount tag
                Positioned(
                  top: 0,
                  child: URoundedContainer(
                    radius: USizes.sm,
                    backgroundColor: UColors.yellow.withValues(alpha: 0.8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: USizes.sm,
                      vertical: USizes.xs,
                    ),
                    child: Text(
                      '20%',
                      style: Theme.of(
                        context,
                      ).textTheme.labelLarge!.apply(color: UColors.black),
                    ),
                  ),
                ),

                //favorite button
                Positioned(
                  right: 0,
                  top: -7,
                  child: UCircularIcon(icon: Iconsax.heart5,color: Colors.red,),
                ),
              ],
            ),
          ),

          /// right portion
          SizedBox(
            width:  170,
            child: Padding(
              padding: const EdgeInsets.only(left: USizes.sm,top: USizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///product title
                      UProductTitleText(title: 'Blue Bata Shoes',smallSize: true,),
                      SizedBox(height: USizes.spaceBtwItems/2,),
                      // product brand

                      UBrandTitleWithVerifyIcon(title: 'Bata')
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: UProductPriceText(price: '65')),
                      Container(
                        width: USizes.iconMd*1.02,
                        height: USizes.iconMd*1.02,
                        decoration: BoxDecoration(
                            color: UColors.primary,
                            borderRadius: BorderRadius.only(
                              topLeft:Radius.circular(USizes.cardRadiusMd) ,
                              bottomRight: Radius.circular(USizes.productImageRadius),
                            )
                        ),
                        child: Icon(Iconsax.add,color: UColors.white,),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
