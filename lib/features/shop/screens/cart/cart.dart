import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/utils/constants/Sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../common/widgets/products/cart/product_quantity_with_add_remove.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Padding(
        padding: UPadding.screenPadding,
        child: ListView.separated(
          separatorBuilder: (context, index) =>
              SizedBox(height: USizes.spaceBtwSections),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: [
                UCartItem(),
                SizedBox(width: USizes.spaceBtwItems),

                /// price, counter button
                Row(
                  children: [
                    ///extra space
                    SizedBox(width: 70.0),

                    ///quantity buttons
                    UProductQuantityWithAddRemove(),
                    Spacer(),

                    //price
                    UProductPriceText(price: '333'),
                  ],
                ),
              ],
            );
          },
        ),
      ),

      bottomNavigationBar:
      Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child: UElevatedButton(onPressed: (){}, child: Text('Checkout \$ 2556.2')),
      ),
    );
  }
}
