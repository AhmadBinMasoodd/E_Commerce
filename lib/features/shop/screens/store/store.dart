import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/common/widgets/texts/brand_title_with_verify_icon.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/screens/store/widgets/store_primary_header.dart';
import 'package:e_commerce/utils/constants/Sizes.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enum.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/brands/brand_card.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 450,
              pinned: true,
              floating: true,
              flexibleSpace: Column(
                children: [

                  //primary header
                  UStorePrimaryHeader(),
                  SizedBox(height: USizes.spaceBtwItems,),

                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
                   child: Column(
                     children: [
                       //brands heading
                       USectionHeading(category: 'Brands', onPressed: () {}),

                       // brand card
                       SizedBox(
                         height: USizes.brandCardHeight,
                         child: ListView.separated(
                           separatorBuilder: (context, index) => SizedBox(width: USizes.spaceBtwItems/2,),
                           shrinkWrap: true,
                           itemCount: 10,
                           scrollDirection: Axis.horizontal,
                           itemBuilder: (context, index) => UBrandCard(),
                         ),
                       )
                     ],
                   ),
                 )

                ],
              ),
            ),
          ];
        },
        body: Container(),
      ),
    );
  }
}

