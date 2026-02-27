import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/shimmer/brands_shimmer.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/controllers/brands/brands_controller.dart';
import 'package:e_commerce/features/shop/controllers/category/category_controller.dart';
import 'package:e_commerce/features/shop/screens/brands/brands.dart';
import 'package:e_commerce/features/shop/screens/store/widgets/category_tab.dart';
import 'package:e_commerce/features/shop/screens/store/widgets/store_primary_header.dart';
import 'package:e_commerce/utils/constants/Sizes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    final brandController = Get.put(BrandsController());
    return DefaultTabController(
      length: controller.featuredCategories.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 340,
                pinned: true,
                floating: false,
                flexibleSpace: SingleChildScrollView(
                  child: Column(
                    children: [
                      //primary header
                      UStorePrimaryHeader(),
                      SizedBox(height: USizes.spaceBtwItems),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: USizes.defaultSpace,
                        ),
                        child: Column(
                          children: [
                            //brands heading
                            USectionHeading(
                              category: 'Brands',
                              onPressed: () => Get.to(() => BrandsScreen()),
                            ),

                            // brand card
                            SizedBox(
                              height: USizes.brandCardHeight,
                              child: Obx(()
                              {
                                if(brandController.isLoading.value){
                                  return UBrandsShimmer();
                                }
                                if(brandController.featuredBrands.isEmpty){
                                  return Text('Brands Not Fount');
                                }
                                return ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      SizedBox(width: USizes.spaceBtwItems / 2),
                                  shrinkWrap: true,
                                  itemCount:
                                      brandController.featuredBrands.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final brand =
                                        brandController.featuredBrands[index];
                                    return SizedBox(
                                      width: USizes.brandCardWidth,
                                      child: UBrandCard(brand: brand),
                                    );
                                  },
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                bottom: UTabBar(
                  tabs: controller.featuredCategories
                      .map((category) => Tab(child: Text(category.name)))
                      .toList(),
                ),
              ),
            ];
          },
          body: Padding(
            padding: UPadding.screenPadding,
            child: TabBarView(
              children: controller.featuredCategories
                  .map((category) => UCategoryTab())
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
