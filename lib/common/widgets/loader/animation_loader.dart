import 'package:e_commerce/utils/constants/Sizes.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
class UAnimationLoader extends StatelessWidget {
  const UAnimationLoader({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(UImages.loadingAnimation,width: Get.width*0.8),
          SizedBox(height: USizes.defaultSpace,),
          Text(text,style: Theme.of(context).textTheme.bodyMedium,),
          const SizedBox(height: USizes.defaultSpace,),
        ],
      ),
    );
  }
}
