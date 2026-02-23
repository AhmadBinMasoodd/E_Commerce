import 'dart:io';
import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/features/personalization/screens/edit_profile/widgets/reauthenticate_user_form.dart';
import 'package:e_commerce/utils/constants/Sizes.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final _userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  RxBool profileLoading = false.obs;

  final email = TextEditingController();
  final password = TextEditingController();
  final reAuthFormKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = false.obs;
  RxBool isImageUploading=false.obs;
  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

  // function to fetch user details
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      UserModel user = await _userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// [popup] to delete account confirmation

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(USizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete your account permanently?',
      confirm: ElevatedButton(
        onPressed: () => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: BorderSide(color: Colors.red),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: USizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Get.back(),
        child: Text('Cancel'),
      ),
    );
  }

  /// [delete] account
  Future<void> deleteUserAccount() async {
    try {
      UFullScreenLoader.openLoadingDialog('Processing.....');
      final authRepository = AuthenticationRepository.instance;
      final provider = authRepository.currentUser!.providerData
          .map((e) => e.providerId)
          .first;
      if (provider == 'google.com') {
      }
      //if email and password provider
      else if (provider == 'password') {
        UFullScreenLoader.stopLoading();
        Get.to(() => ReauthenticateUserForm());
      }
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  Future<void> reAuthenticateUser() async {
    try {
      UFullScreenLoader.openLoadingDialog("Processing........");

      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        return;
      }
      if (!reAuthFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateUserWithEmailAndPassword(
            email.text.trim(),
            password.text,
          );

      ///delete account
      await AuthenticationRepository.instance.deleteAccount();

      UFullScreenLoader.stopLoading();

      /// redirect
      Get.offAll(() => LoginScreen());
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: 'Error Deleting Account',
        message: e.toString(),
      );
    }
  }

  Future<void> updateUserProfilePicture() async {
    try {

      isImageUploading.value=true;
      ///pick image from gallery
      XFile? image=await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 512,
        maxWidth: 512,
      );
      if(image==null){
        return;
      }


      ///convert xfile to file
      File file=File(image.path);
      ///delete user current profile picture
      if(user.value.publicId.isNotEmpty){

        await _userRepository.deleteProfilePicture(user.value.publicId);
      }

      ///upload profile picture to cloudinary
      dio.Response response=await _userRepository.uploadImage(file);
      if(response.statusCode==200){
        final data=response.data;
        final imageUrl=data['url'];
        final publicId=data['public_id'];
        await _userRepository.updateSingleField({'profilePicture':imageUrl,'publicId':publicId});
        user.value.profilePicture=imageUrl;
        user.value.publicId=publicId;
        user.refresh();

        USnackBarHelpers.successSnackBar(title: 'Congratulations',message: 'Profile picture updated successfully');
      }else{
        throw  'Failed to upload profile picture please try again';
      }

    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Failed',message:e.toString());
    }finally{
      isImageUploading.value=false;

    }
  }


}