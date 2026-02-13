
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
    this.showBorder=true
  });
  final bool showBorder;
  @override
  Widget build(BuildContext context) {
    return URoundedContainer(
      width: USizes.brandCardWidth,
      showBorder: showBorder,
      padding: EdgeInsets.all(USizes.sm),
      backgroundColor: Colors.transparent,
      child: Row(
        children: [
          //brand image
          Flexible(child: URoundedImage(
              imageUrl: UImages.bagsIcon,
            backgroundColor: Colors.transparent,
          )
          ),
          SizedBox(width: USizes.spaceBtwItems/2,),
          ///brand name and verify icon

          ///right portion
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                //brand name verify icon
                UBrandTitleWithVerifyIcon(
                  title: 'Bata',
                  brandTextSize: TextSizes.large,
                ),
                //product text
                Text('172 products',
                  style: Theme.of(context).textTheme.labelMedium,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),

        ],
      ),
    );

  }
}
