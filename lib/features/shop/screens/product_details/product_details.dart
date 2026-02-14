import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_thumbnail_slider.dart';
import 'package:e_commerce/utils/constants/Sizes.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';


class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// product image with slider
            UThumbnailAndSlider(),

           Padding(
             padding: UPadding.screenPadding,
             child: Column(
               children: [
                 //// product details
                 //// price title stock and brand
                 UProductMetaData(),

                 //// attributes

                 UProductAttributes(),
                 SizedBox(height: USizes.spaceBtwSections,),
                 //// checkout items
                 UElevatedButton(onPressed: (){}, child: Text('Checkout Button')),
                 SizedBox(height: USizes.spaceBtwSections,),

                 /// description
                 ///
                 USectionHeading(category: 'Description',showActionButton: false,),
                 SizedBox(height:USizes.spaceBtwItems),
                 ReadMoreText(
                   'This is the product of iphone 11 with 512 GB This is the product of iphone 11 with 512 GB This is the product of iphone 11 with 512 GB',
                   trimLines: 3,
                   trimMode: TrimMode.Line,
                   trimCollapsedText: 'Show more',
                   trimExpandedText: 'Less',
                   moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                   lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),

                 ),
                 SizedBox(height: USizes.spaceBtwItems,),
               ],
             ),
           )
          ],
        ),
      ),

      /////// bottom navigation

      bottomNavigationBar: UBottomAddToCart(),
    );
  }
}

