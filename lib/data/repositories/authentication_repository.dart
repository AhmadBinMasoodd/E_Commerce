import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_commerce/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_commerce/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final _auth=FirebaseAuth.instance;
  final localStorage = GetStorage();

  // @override
  // void onInit(){
  //
  //   super.onInit();
  // }
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() {
    localStorage.writeIfNull('isFirstTime', true);
    localStorage.read('isFirstTime') != true
        ? Get.to(() => LoginScreen())
        : Get.to(() => OnboardingScreen());
  }

  ///[Authentication] with email and password
  Future<UserCredential> registerUser(String email,String password)async{
    try{
      UserCredential userCredential=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }on FirebaseAuthException catch(e){
      throw UFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw UFirebaseException(e.code).message;
    } on UPlatformException catch(e){
      throw UFirebaseException(e.code).message;
    }catch(e){
      throw "Something went wrong. Please try again";
    }
  }
}
