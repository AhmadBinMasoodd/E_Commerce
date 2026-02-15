import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/products/cart/product_quantity_with_add_remove.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/Sizes.dart';

class UCartItems extends StatelessWidget {
  const UCartItems({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) =>
          SizedBox(height: USizes.spaceBtwSections),
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            UCartItem(),
            if (showAddRemoveButton) SizedBox(width: USizes.spaceBtwItems),

            /// price, counter button
            if (showAddRemoveButton)
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
    );
  }
}
