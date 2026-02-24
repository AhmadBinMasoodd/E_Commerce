import 'package:e_commerce/common/widgets/shimmer/category_shimmer.dart';
import 'package:e_commerce/features/shop/controllers/category/category_controller.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/features/shop/screens/sub_category/sub_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/imageText/vertical_image_text.dart';
import '../../../../../utils/constants/Sizes.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text.dart';

class UHomeCategories extends StatelessWidget {
  const UHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Padding(
      padding: EdgeInsets.only(left: USizes.spaceBtwSections),
      child: Column(
        children: [
          Text(
            UTexts.homeCategories,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium!.apply(color: UColors.white),
          ),
          SizedBox(height: USizes.spaceBtwItems),

          Obx(() {
            final categories=controller.featuredCategories;
            if(controller.isCategoryLoading.value){
              return UCategoryShimmer(itemCount: 6,);
            }
            if(categories.isEmpty){
              return Text('Categories Not Found');
            }
            return SizedBox(
              height: 82,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    SizedBox(width: USizes.spaceBtwItems),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  CategoryModel category=categories[index];
                  return UVerticalImageText(
                    title: category.name,
                    image: category.image,
                    textColor: UColors.white,
                    onTap: () => Get.to(() => SubCategoryScreen()),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
