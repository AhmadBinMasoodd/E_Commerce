import 'package:e_commerce/data/repositories/brands/brands_repository.dart';
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/dummy_data.dart';
import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_commerce/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_commerce/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  final localStorage = GetStorage();

  User? get currentUser=>_auth.currentUser;

  // @override
  // void onInit(){
  //
  //   super.onInit();
  // }
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
    //Get.put(BannersRepository()).uploadBanners(UDummyData.banner);
    //Get.put(CategoryRepository()).uploadCategory(UDummyData.categories);
    Get.put(BrandsRepository()).uploadBrands(UDummyData.brands);
  }

  void screenRedirect() {
    final user = _auth.currentUser;
    if (user != null) {
      if(user.emailVerified){
        Get.offAll(NavigationMenu());
      }else{
        Get.offAll(()=>VerifyEmailScreen(email: user.email,));
      }
    } else {
      localStorage.writeIfNull('isFirstTime', true);
      localStorage.read('isFirstTime') != true
          ? Get.to(() => LoginScreen())
          : Get.to(() => OnboardingScreen());
    }
  }

  ///[Authentication] with email and password
  Future<UserCredential> registerUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on UPlatformException catch (e) {
      throw UFirebaseException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  ///[EmailAuthentication] with email and password
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on UPlatformException catch (e) {
      throw UFirebaseException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }


  ///[verification] email

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on UPlatformException catch (e) {
      throw UFirebaseException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }
  /// [logout] logout the use

  Future<void> logout()async{
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=>LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on UPlatformException catch (e) {
      throw UFirebaseException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }


 /// [ Forget_Password ] Send email to reset password

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on UPlatformException catch (e) {
      throw UFirebaseException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }


  /// [ ReAuthentication ] Send email to reset password

  Future<void> reAuthenticateUserWithEmailAndPassword(String email,String password) async {
    try {
      AuthCredential credential=EmailAuthProvider.credential(email: email, password: password);
      await currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on UPlatformException catch (e) {
      throw UFirebaseException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  /// [Delete_User] delete user account

  Future<void> deleteAccount()async{
    try{
      await UserRepository.instance.removeUserRecord(currentUser!.uid);
      if(UserController.instance.user.value.publicId.isNotEmpty){
        UserRepository.instance.deleteProfilePicture(UserController.instance.user.value.publicId);
      }
      await _auth.currentUser?.delete();
    }
    catch(e){
      throw "Something went wrong. Please try again";
    }
  }
}
