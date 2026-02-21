import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/utils/constants/keys.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart'
    show UPlatformException;

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// [Save] function to save user record

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db
          .collection(UKeys.userCollection)
          .doc(user.id)
          .set(user.toJson());
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

  /// [Fetch] function to fetch user details
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapShot = await _db
          .collection(UKeys.userCollection)
          .doc(AuthenticationRepository.instance.currentUser!.uid)
          .get();
      if (documentSnapShot.exists) {
        UserModel user = UserModel.fromSnapshot(documentSnapShot);
        return user;
      }
      return UserModel.empty();
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

/// [Update] function to fetch user details
  Future<void> updateSingleField(Map<String,dynamic> map) async {
    try {

      await _db.collection(UKeys.userCollection).doc(AuthenticationRepository.instance.currentUser!.uid).update(map);
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

  /// [Delete] function to delete user details

  Future<void> removeUserRecord(String userId)async{
    try {

      await _db.collection(UKeys.userCollection).doc(userId).delete();
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
}
