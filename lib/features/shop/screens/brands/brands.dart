import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/models/brands_model.dart';
import 'package:e_commerce/features/shop/screens/brands/brand_products.dart';
import 'package:e_commerce/utils/constants/Sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('Brands', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              USectionHeading(category: 'Brands',showActionButton: false,),
              SizedBox(height: USizes.spaceBtwItems,),

              //list of brands
              UGridLayout(
                itemCount: 10, itemBuilder: (context, index) => UBrandCard(onTap: ()=>Get.to(()=>BrandProductsScreen()),brand: BrandModel.empty(),),mainAxisExtent: 80,)

            ],
          ),
        ),
      ),
    );
  }
}
