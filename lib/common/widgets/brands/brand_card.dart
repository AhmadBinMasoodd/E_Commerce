
import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/features/shop/models/brands_model.dart';
import 'package:e_commerce/utils/constants/Sizes.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/enum.dart';
import '../texts/brand_title_with_verify_icon.dart';
class UBrandCard extends StatelessWidget {
  const UBrandCard({
    super.key,
    this.showBorder=true,
    this.onTap,
    required this.brand
  });
  final bool showBorder;
  final VoidCallback? onTap;
  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: URoundedContainer(
        height: USizes.brandCardHeight,
        showBorder: showBorder,
        padding: EdgeInsets.all(USizes.sm),
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            //brand image
            Flexible(child: URoundedImage(
                imageUrl: brand.image,
              isNetworkImage: true,
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
                    title: brand.name,
                    brandTextSize: TextSizes.large,
                  ),
                  //product text
                  Text('${brand.productCount} products',
                    style: Theme.of(context).textTheme.labelMedium,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
      
          ],
        ),
      ),
    );

  }
}
