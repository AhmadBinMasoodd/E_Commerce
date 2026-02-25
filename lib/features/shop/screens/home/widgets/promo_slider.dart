import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce/features/shop/controllers/banner/banner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/Sizes.dart';
import 'banners_dot_navigation.dart';

class UPromoSlider extends StatelessWidget {
  const UPromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final bannerController = Get.put(BannerController());
    return Obx(() {
      if (bannerController.isBannerLoading.value) {
        return UShimmerEffect(width: double.infinity, height: 190);
      }
      if (bannerController.banners.isEmpty) {
        return Text('Banners Not Found');
      }
      return Column(
        children: [
          CarouselSlider(
            items: bannerController.banners
                .map(
                  (banner) => URoundedImage(
                    imageUrl: banner.imageUrl,
                    isNetworkImage: true,
                    onPressed: () => Get.toNamed(banner.targetScreen),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, reason) =>
                  bannerController.onPageChanged(index),
            ),
            carouselController: bannerController.carouselController,
          ),
          SizedBox(height: USizes.spaceBtwItems),

          BannerDotNavigator(),
        ],
      );
    });
  }
}
