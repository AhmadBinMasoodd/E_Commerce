import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helpers_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/Sizes.dart';
import '../../../styles/shadow.dart';
import '../../../../utils/constants/images.dart';
import '../../images/rounded_image.dart';
import '../../texts/brand_title_with_verify_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class UProductCardVertical extends StatelessWidget {
  const UProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: UShadow.verticalProductShadow,
          borderRadius: BorderRadius.circular(USizes.productImageRadius),
          color: dark ? UColors.dark : UColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            URoundedContainer(
              width: 180,
              padding:EdgeInsets.all(USizes.sm),
              backgroundColor: dark ? UColors.dark : UColors.grey,
              child: Stack(
                ///thumbnail
                children: [
                  URoundedImage(imageUrl: UImages.productImage15),
      
                //  discount tag
                  Positioned(
                    top: -5,
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
                    top: 0,
                    child: UCircularIcon(icon: Iconsax.heart5,color: Colors.red,),
                  ),
                ],
              ),
            ),
      
      
      
            SizedBox(height: USizes.spaceBtwItems/2),
      
      
            Padding(
      
              padding: const EdgeInsets.only(left: USizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UProductTitleText(title: 'Blue Bata Shoes',smallSize: true,),
                  SizedBox(height: USizes.spaceBtwItems/2,),
                  UBrandTitleWithVerifyIcon(title: 'bata'),
                ],
              ),
            ),
            //
      
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(padding: const EdgeInsets.only(left: USizes.sm),
                  child: UProductPriceText(price: '76'),
                ),
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
            ),
      
      
      
      
      
          ],
        ),
      ),
    );
  }
}
