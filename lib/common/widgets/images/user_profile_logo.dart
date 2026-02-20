import 'package:flutter/material.dart';

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
  }
}
