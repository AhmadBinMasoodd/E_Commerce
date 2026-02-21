

import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangeNameController extends GetxController{
  static ChangeNameController get instance=>Get.find();

  final firstName=TextEditingController();
  final lastName=TextEditingController();
  final _userController=UserController.instance;
  final _userRepository=UserRepository.instance;
  final updateUserFormKey=GlobalKey<FormState>();
  @override
  void onInit() {
    initializeName();
    super.onInit();
  }
  void initializeName(){
    firstName.text=_userController.user.value.firstName;
    lastName.text=_userController.user.value.lastName;
  }
  Future<void> updateUserName()async{
    try{
      ///start loading
      UFullScreenLoader.openLoadingDialog('We are updating your information.....');
      ///check internet connectivity
      bool isConnected=await NetworkManager.instance.isConnected();
      if(!isConnected){
        UFullScreenLoader.stopLoading();
        //USnackBarHelpers.warningSnackBar(title: 'No Internet Connection!');
        return;
      }

      //form validation
      if(!updateUserFormKey.currentState!.validate()){
        UFullScreenLoader.stopLoading();
        return;
      }
      //update user name from firestore
      Map<String,dynamic> map={'firstName':firstName.text , 'lastName':lastName.text };
      await _userRepository.updateSingleField(map);
      //update user from Rx user
      _userController.user.value.firstName=firstName.text;
      _userController.user.value.lastName=lastName.text;
      //stop loading
      UFullScreenLoader.stopLoading();

      Get.offAll(()=>NavigationMenu());
      USnackBarHelpers.successSnackBar(title: 'Congratulations',message: 'Your name has been updated');

    }catch(e){
      UFullScreenLoader.stopLoading();

      USnackBarHelpers.errorSnackBar(title: 'Update Name Failed',message: e.toString());
    }
  }
}