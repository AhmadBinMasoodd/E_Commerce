import 'package:e_commerce/features/shop/controllers/banner/banner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerDotNavigator extends StatelessWidget {
  const BannerDotNavigator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bannerController=BannerController.instance;

    return Obx(()=> SmoothPageIndicator(
      controller: PageController(initialPage:bannerController.currentIndex.value ),
      count: bannerController.banners.length,
      effect:ExpandingDotsEffect(
        dotHeight: 6.0,

      ) ,
    ));
  }
}
