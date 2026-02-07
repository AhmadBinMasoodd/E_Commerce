import 'package:flutter/material.dart';

import '../../../utils/constants/Sizes.dart';
class UGridLayout extends StatelessWidget {
  const UGridLayout({
    super.key, required this.itemCount, this.mainAxisCount=288, required this.itemBuilder,
  });
  final int itemCount;
  final double? mainAxisCount;
  final Widget Function(BuildContext,int index) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: itemCount,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: USizes.gridViewSpacing,
          mainAxisSpacing: USizes.gridViewSpacing,
          mainAxisExtent: mainAxisCount
      ),
      itemBuilder: itemBuilder,
    );
  }
}
