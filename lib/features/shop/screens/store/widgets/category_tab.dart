import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brand_showcase.dart';
import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/Sizes.dart';
import '../../../../../utils/constants/images.dart';

class UCategoryTab extends StatelessWidget {
  const UCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
          child: Column(
            children: [
              //brand showcase 1
              UBrandShowcase(
                images: [
                  UImages.productImage47,
                  UImages.productImage43,
                  UImages.productImage7,
                ],
              ),

              //brand showcase 2
              UBrandShowcase(
                images: [
                  UImages.productImage47,
                  UImages.productImage43,
                  UImages.productImage7,
                ],
              ),
              SizedBox(height: USizes.spaceBtwItems),
              //you might like section heading
              USectionHeading(category: 'You might like', onPressed: () {}),
              //grid layout products
              UGridLayout(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return UProductCardVertical();
                },
              ),
              SizedBox(height: USizes.spaceBtwSections,)
            ],
          ),
        ),
      ],
    );
  }
}
