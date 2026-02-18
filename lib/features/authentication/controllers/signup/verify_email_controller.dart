import 'dart:async';

import 'package:e_commerce/common/widgets/screens/success_screen.dart';
import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/text.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sentEmailVerification();
    setTimerAutoRedirect();
    super.onInit();
    //
  }

  ///Send email verification link to current user
  Future<void> sentEmailVerification() async {
    try {
      AuthenticationRepository.instance.sendEmailVerification();
      USnackBarHelpers.successSnackBar(
        title: 'Email Sent',
        message: 'Please check your inbox and verify your email',
      );
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  void setTimerAutoRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser!.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            title: UTexts.accountCreatedTitle,
            subtitle: UTexts.accountCreatedSubtitle,
            image: UImages.successfulPaymentIcon,
            onTap: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }
  Future<void> checkEmailVerificationStatus()async{
    try{
      final currentUser=FirebaseAuth.instance.currentUser;
      if(currentUser!=null&&currentUser.emailVerified){
        Get.off(
              () => SuccessScreen(
            title: UTexts.accountCreatedTitle,
            subtitle: UTexts.accountCreatedSubtitle,
            image: UImages.successfulPaymentIcon,
            onTap: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    }catch(e){

    }
  }

}
