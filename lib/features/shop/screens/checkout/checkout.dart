import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/common/widgets/screens/success_screen.dart';
import 'package:e_commerce/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/constants/Sizes.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/button/elevated_button.dart';
import '../../../../common/widgets/text_fields/promo_code.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ////////////aap bar
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      ///////////body
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              ////////// ITems
              UCartItems(showAddRemoveButton: false),
              SizedBox(height: USizes.spaceBtwSections),

              //promo code TextField
              UPromoCodeField(),
              SizedBox(height: USizes.spaceBtwSections),

              /// billing amount section
              URoundedContainer(
                showBorder: true,
                backgroundColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(USizes.md),
                  child: Column(
                    children: [
                      ///amount
                      UBillingAmountSection(),
                      SizedBox(height: USizes.spaceBtwItems),

                      //billing section
                      UBillingPaymentSection(),
                      SizedBox(height: USizes.spaceBtwItems),

                      ///address
                      UBillingAddressSection(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child: UElevatedButton(
          onPressed: () {
            Get.to(
              () => SuccessScreen(
                title: 'Payment Success',
                subtitle: 'Your Item will be shipped soon',
                image: UImages.successfulPaymentIcon,
                onTap: () =>Get.offAll(()=>NavigationMenu()),
              ),
            );
          },
          child: Text('Checkout \$ 2556.2'),
        ),
      ),
    );
  }
}
