import 'package:e_commerce/common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce/utils/constants/Sizes.dart';
import 'package:flutter/material.dart';

class UBrandsShimmer extends StatelessWidget {
  const UBrandsShimmer({super.key,  this.itemCount=4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => UShimmerEffect(width: USizes.brandCardWidth, height: USizes.brandCardHeight),
      separatorBuilder: (context, index) =>
          SizedBox(width: USizes.spaceBtwItems),
      itemCount: itemCount,
    );
  }
}
