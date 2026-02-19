
import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{
  static LoginController get instance=>Get.find();

  final email=TextEditingController();
  final password=TextEditingController();
  RxBool isPasswordVisible=false.obs;
  RxBool rememberMe=false.obs;
  final loginFormKey=GlobalKey<FormState>();
  final localStorage=GetStorage();


  @override
  void onInit() {

    email.text=localStorage.read('Remember_email')??"";
    password.text=localStorage.read('Remember_password')??"";
    super.onInit();
  }

  Future<void> loginWithEmailAndPassword()async{
    try{

      UFullScreenLoader.openLoadingDialog("logging you in ....");

      //check internet
      final isConnected=await NetworkManager.instance.isConnected();
      if(!isConnected){
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No internet connection');
        return;
      }
      if(!loginFormKey.currentState!.validate()){
        UFullScreenLoader.stopLoading();
        return;
      }
      //save data if remember me is checked
      if(rememberMe.value){
        localStorage.write('Remember_email', email.text.trim());
        localStorage.write('Remember_password', password.text.trim());

      }
      //login user
      await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      UFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    }catch(e){
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Login Failed',message: e.toString());
    }
  }


}