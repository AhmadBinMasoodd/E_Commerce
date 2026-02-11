import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helpers_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/Sizes.dart';
import '../../../styles/shadow.dart';
import '../../../../utils/constants/images.dart';
import '../../texts/brand_title_with_verify_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class UProductCardVertical extends StatelessWidget {
  const UProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: UShadow.verticalProductShadow,
          borderRadius: BorderRadius.circular(USizes.productImageRadius),
          color: dark ? UColors.dark : UColors.white,
        ),
        child: Stack(
          children: [
            URoundedContainer(
              backgroundColor: dark ? UColors.dark : UColors.grey,
              padding: EdgeInsets.all(USizes.sm),
              child: const Stack(
                children: [Image(image: AssetImage(UImages.productImage1))],
              ),
            ),

            //Discounted
            Positioned(
              top: 6.0,
              child: URoundedContainer(
                backgroundColor: UColors.yellow.withValues(alpha: 0.8),
                padding: EdgeInsets.symmetric(
                  horizontal: USizes.sm,
                  vertical: USizes.xs,
                ),
                child: Text(
                  '20%',
                  style: Theme.of(
                    context,
                  ).textTheme.labelMedium!.apply(color: UColors.black),
                ),
              ),
            ),

            //Favourite button
            Positioned(
              top: 0,
              right: 0,
              child: UCircularIcon(
                onPressed: () {},
                icon: Iconsax.heart,
                color: Colors.red,
              ),
            ),

            SizedBox(height: USizes.spaceBtwItems),

            //
            Padding(
              padding: const EdgeInsets.only(left: USizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UProductTitleText(title: 'Blue Bata Shoes', smallSize: true),
                  SizedBox(height: USizes.spaceBtwItems / 2),
                  UBrandTitleWithVerifyIcon(
                    title: 'Bata',

                  ),
                ],
              ),
            ),
            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: USizes.sm),
                  child: UProductPriceText(price: '76'),
                ),
                Container(
                  width: USizes.iconLg * 1.2,
                  height: USizes.iconLg * 1.2,
                  decoration: BoxDecoration(
                    color: UColors.primary,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(
                        USizes.productImageRadius,
                      ),
                      topLeft: Radius.circular(USizes.cardRadiusMd),
                    ),
                  ),
                  child: Icon(Iconsax.add, color: UColors.light),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


