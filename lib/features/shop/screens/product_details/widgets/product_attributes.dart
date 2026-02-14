import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helpers_function.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';

class UProductAttributes extends StatelessWidget {
  const UProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = UHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        ///selected attributes price and description
        URoundedContainer(
          padding: EdgeInsets.all(USizes.sm),
          backgroundColor: dark ? UColors.darkerGrey : UColors.darkGrey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title price and stock
              Row(
                children: [
                  //variation heading text
                  USectionHeading(
                    category: 'Variations',
                    showActionButton: false,
                  ),
                  SizedBox(width: USizes.spaceBtwItems),
                  Column(
                    children: [
                      //price sales price and actual price
                      Row(
                        children: [
                          //text price
                          UProductTitleText(title: 'Price: ', smallSize: true),
                          //actual price
                          Text(
                            '250',
                            style: Theme.of(context).textTheme.titleSmall!
                                .apply(
                                  decoration: TextDecoration.lineThrough,
                                ),
                          ),
                          SizedBox(width: USizes.spaceBtwItems),

                          ///sales price
                          UProductPriceText(price: '200'),
                        ],
                      ),
                      //stock status
                      Row(
                        children: [
                          UProductTitleText(title: 'Stock', smallSize: true),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              ///attributes description
              ///
              UProductTitleText(
                title: 'This is the product of iphone 11 with 512GB',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),

        SizedBox(height: USizes.spaceBtwItems),

        ///attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            USectionHeading(category: 'Colors', showActionButton: false),
            SizedBox(width: USizes.spaceBtwItems/2,),
            Wrap(
              spacing: USizes.sm,
              children: [
                UChoiceChip(text: 'Red', selected: true, onSlected: (value) {}),
                UChoiceChip(text: 'Green', selected: false, onSlected: (value) {}),
                UChoiceChip(text: 'Blue', selected: true, onSlected: (value) {}),
              ],
            )

          ],
        ),

        //sizes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            USectionHeading(category: 'Sizes', showActionButton: false),
            SizedBox(width: USizes.spaceBtwItems/2,),
            Wrap(
              spacing: USizes.sm,
              children: [
                UChoiceChip(text: 'Small', selected: true, onSlected: (value) {}),
                UChoiceChip(text: 'Medium', selected: false, onSlected: (value) {}),
                UChoiceChip(text: 'Large', selected: true, onSlected: (value) {}),
              ],
            )

          ],
        ),
      ],
    );
  }
}
