import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/rounded_container.dart';
import '../../../../../common/widgets/images/circular_image.dart';
import '../../../../../common/widgets/texts/brand_title_with_verify_icon.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../utils/constants/Sizes.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images.dart';

class UProductMetaData extends StatelessWidget {
  const UProductMetaData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///sales tag
        Row(
          children: [
            URoundedContainer(
              radius: USizes.sm,
              backgroundColor: UColors.yellow.withValues(alpha: 0.8),
              padding: const EdgeInsets.symmetric(
                horizontal: USizes.sm,
                vertical: USizes.xs,
              ),
              ///sales tag
              child: Text(
                '20%',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.apply(color: UColors.black),
              ),
            ),
            SizedBox(width: USizes.spaceBtwItems),
            //price
            Text(
              '\$250',
              style: Theme.of(context).textTheme.titleSmall!.apply(
                decoration: TextDecoration.lineThrough,
              ),
            ),
            SizedBox(width: USizes.spaceBtwItems/2),
            ///actual price
            UProductPriceText(price: '150', isLarge: true),
            Spacer(),
            IconButton(onPressed: (){}, icon: Icon(Icons.share))

          ],
        ),
        SizedBox(height: USizes.spaceBtwItems/1.5,),

        ////product title
        UProductTitleText(title: 'IPhone 11'),
        SizedBox(height: USizes.spaceBtwItems/1.5,),

        ///product stock
        Row(
          children: [
            UProductTitleText(title: 'Status: '),
            SizedBox(width: USizes.spaceBtwItems,),
            Text('In Stock',style: Theme.of(context).textTheme.titleMedium,)
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems/1.5,),

        Row(
          children: [
            UCircularImage(
              padding: 0,
              image: UImages.appleLogo,width: 32.0,height: 32.0,),
            SizedBox(width: USizes.spaceBtwItems,),
            UBrandTitleWithVerifyIcon(title: 'Apple')
          ],
        )
      ],
    );
  }
}
