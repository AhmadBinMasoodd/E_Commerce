import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/brands/brand_card.dart';
import 'package:e_commerce/features/shop/models/brands_model.dart';
import 'package:e_commerce/utils/constants/Sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/sortable_products.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('Bata', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body:SingleChildScrollView(
        child: Padding(padding: UPadding.screenPadding,child: Column(
          children: [
            UBrandCard(brand: BrandModel.empty(),),
            SizedBox(height: USizes.spaceBtwSections,),
            USortableProducts(),

          ],
        ),),
      ) ,
    );
  }
}
