import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/features/authentication/screens/forget_password/reset_password.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPassowrdController extends GetxController{
  static ForgetPassowrdController get instance =>Get.find();

  ///variables
  final email=TextEditingController();
  final forgetPasswordFormKey=GlobalKey<FormState>();

  ///send email to forget password
  Future<void> sendPasswordResetEmail()async{
    try{
      UFullScreenLoader.openLoadingDialog('Processing your request....');

      //check internet connectivity
      bool isConnected=await NetworkManager.instance.isConnected();
      if(!isConnected){
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connected');
        return;
      }

      ///form vekidation
      if(!forgetPasswordFormKey.currentState!.validate()){
        UFullScreenLoader.stopLoading();
        return;
      }


      //send email to reset password
      AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());
      UFullScreenLoader.stopLoading();
      
      ///success message
      USnackBarHelpers.successSnackBar(title: 'Email Sent',message: 'Email link Sent to Reset your Password');

      //redirect to reset password screen
      Get.to(()=>ResetPasswordScreen(email: email.text,));

    }catch(e){
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Failed Forget Password',message: e.toString());
    }
  }

  Future<void> resendPasswordResetEmail()async{
    try{
      UFullScreenLoader.openLoadingDialog('Processing your request....');

      //check internet connectivity
      bool isConnected=await NetworkManager.instance.isConnected();
      if(!isConnected){
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connected');
        return;
      }

      ///form vekidation
      if(forgetPasswordFormKey.currentState!.validate()){
        UFullScreenLoader.stopLoading();


        return;
      }


      //send email to reset password
      AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());
      UFullScreenLoader.stopLoading();

      ///success message
      USnackBarHelpers.successSnackBar(title: 'Email Sent',message: 'Email link Sent to Reset your Password');

    }catch(e){
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Failed Forget Password',message: e.toString());
    }
  }


}