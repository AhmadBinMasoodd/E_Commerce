import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helpers_function.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/loader/animation_loader.dart';

class UFullScreenLoader {
  static void openLoadingDialog(String text) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: UHelperFunctions.isDarkMode(Get.context!)
              ? UColors.dark
              : UColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              UAnimationLoader(text: text),
            ],
          ),
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
