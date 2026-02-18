import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //auth repository
  ///variable
  final _authRepository = Get.put(AuthenticationRepository());
  final signupFormKey = GlobalKey<FormState>();
  final RxBool isPasswordVisible = false.obs;
  final RxBool privacyPolicy = false.obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final password = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();

  ///function to register the user with email and password
  Future<void> registerUser() async {
    //show loading

    try {
      UFullScreenLoader.openLoadingDialog('We are processing your information');
      bool isConnected = await Get.put(NetworkManager()).isConnected();

      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet connection');
        return;
      }
      if (!privacyPolicy.value) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(
          title: 'Accept Privacy policy',
          message:
          'In Order to create account you must have to read and accept the privacy policy',
        );
        return;
      }
      if (!signupFormKey.currentState!.validate()) {
        return;
      }
      UserCredential userCredential = await _authRepository.registerUser(
        email.text.trim(),
        password.text.trim(),
      );
      UserModel userModel = UserModel(id: userCredential.user!.uid,
          firstName: firstName.text,
          lastName: lastName.text,
          username: '${firstName.text}${lastName.text}123',
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: ''
      );

      final userRepository=Get.put(UserRepository());
      await userRepository.saveUserRecord(userModel);
      
      
      USnackBarHelpers.successSnackBar(title: 'Email Verification Sent',message: 'Click the link to verify your email');
      UFullScreenLoader.stopLoading();
      
      Get.to(()=>VerifyEmailScreen(email: email.text,));

      //USnackBarHelpers.successSnackBar(title: 'title')
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Error',message: e.toString());
    }
  }
}
