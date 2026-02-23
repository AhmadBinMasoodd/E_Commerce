import 'package:e_commerce/common/widgets/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../features/personalization/controllers/user_controller.dart';
import '../../../utils/constants/images.dart';
import 'circular_image.dart';

class UserProfileLogo extends StatelessWidget {
  const UserProfileLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final bool isProfileAvailable =
        controller.user.value.profilePicture.isNotEmpty;
    return Obx((){
      bool isProfileAvailable=controller.user.value.profilePicture.isNotEmpty;
      if(controller.isImageUploading.value){
        return UShimmerEffect(width: 120.0, height: 120.0,radius: 1000,);
      }
      return UCircularImage(
        isNetworkImage: isProfileAvailable ? true : false,
        image: isProfileAvailable
            ? controller.user.value.profilePicture
            : UImages.profileLogo,
        height: 120.0,
        width: 120.0,
        borderWidth: 5,
        padding: 0,
      );
    });
  }
}
