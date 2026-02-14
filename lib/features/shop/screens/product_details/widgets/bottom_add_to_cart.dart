import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/utils/constants/Sizes.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helpers_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UBottomAddToCart extends StatelessWidget {
  const UBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunctions.isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
        color: dark ? UColors.dark : UColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(USizes.cardRadiusLg),
          topRight: Radius.circular(USizes.cardRadiusLg),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: USizes.defaultSpace,
        vertical: USizes.defaultSpace / 2,
      ),
      child: Row(
        children: [
          //decrement icon
          UCircularIcon(
            icon: Iconsax.minus,
            backgroundColor: UColors.darkGrey,
            width: 40,
            height: 40,
            color: UColors.white,
          ),
          SizedBox(width: USizes.spaceBtwItems),

          //counter
          Text('2', style: Theme.of(context).textTheme.titleSmall),
          SizedBox(width: USizes.spaceBtwItems),
          //increment icon
          UCircularIcon(
            icon: Iconsax.add,
            backgroundColor: UColors.black,
            width: 40,
            height: 40,
            color: UColors.white,
          ),
          Spacer(),
          //add to cart button
          ElevatedButton(
              onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: EdgeInsets.all(USizes.md),
              side: BorderSide(color: UColors.black),
            ),
            child: Row(
              children: [
                Icon(Iconsax.shopping_bag),
                SizedBox(width: USizes.spaceBtwItems/2,),
                Text('Add to Cart')
              ],
            ),

          )
        ],
      ),
    );
  }
}
