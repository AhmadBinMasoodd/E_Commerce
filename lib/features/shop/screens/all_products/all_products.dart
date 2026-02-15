import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/utils/constants/Sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        title: Text(
          'Popular Products',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              ///filter
              DropdownButtonFormField(
                decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                onChanged: (value) {},
                items: ['Name', 'Lower Price', 'Higher Price', 'Sale', 'Newest']
                    .map((filter) {
                      return DropdownMenuItem(value: filter,child: Text(filter));
                    })
                    .toList(),
              ),
              SizedBox(height: USizes.spaceBtwSections,),
              UGridLayout(itemCount: 10, itemBuilder:
                  (context, index) => UProductCardVertical(),)
            ],
          ),
        ),
      ),
    );
  }
}
