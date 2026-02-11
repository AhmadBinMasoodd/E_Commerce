
import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/utils/constants/Sizes.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/enum.dart';
import '../texts/brand_title_with_verify_icon.dart';
class UBrandCard extends StatelessWidget {
  const UBrandCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return URoundedContainer(
      width:USizes.brandCardWidth ,
      showBorder: true,
      padding: EdgeInsets.all(USizes.sm),
      backgroundColor: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: URoundedImage(imageUrl: UImages.bagsIcon)),
          SizedBox(width: USizes.spaceBtwItems,),

          Flexible(
            child: Column(
              children: [
                UBrandTitleWithVerifyIcon(
                  title: 'Bata',
                  brandTextSize: TextSizes.large,
                ),
                Text(
                  '172 products',
                  style: Theme.of(context).textTheme.labelMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
