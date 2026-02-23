import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/utils/constants/apis.dart';
import 'package:e_commerce/utils/constants/keys.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart'
    show UPlatformException;
import 'package:dio/dio.dart' as dio;

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
  Future<void> updateSingleField(Map<String, dynamic> map) async {
    try {
      await _db
          .collection(UKeys.userCollection)
          .doc(AuthenticationRepository.instance.currentUser!.uid)
          .update(map);
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

  Future<void> removeUserRecord(String userId) async {
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

  Future<dio.Response> uploadImage(File image) async {
    try {
      String api = UApiUrls.uploadApi(UKeys.cloudName);
      dio.FormData formData = dio.FormData.fromMap({
        'upload_preset': UKeys.uploadPreset,
        'folder': UKeys.profileFolder,
        'file':await dio.MultipartFile.fromFile(image.path,filename:image.path.split('/').last ),
      });
      dio.Response response = await dio.Dio().post(
        api,
        data: formData,
      );
      return response;
    } catch (e) {
      throw 'Failed to upload profile picture please try again';
    }
  }

  Future<dio.Response> deleteProfilePicture(String publicId)async{
    try{

      String api=UApiUrls.deleteApi(UKeys.cloudName);
      int timestamp=(DateTime.now().microsecondsSinceEpoch/1000).round();
      String signatureBase='public_id=$publicId&timestamp=$timestamp${UKeys.apiSecret}';

      String signature = sha1.convert(utf8.encode(signatureBase)).toString();
      dio.FormData formData = dio.FormData.fromMap({
        'public_id': publicId,
        'api_key': UKeys.apiKey,
        'timestamp':timestamp,
        'signature':signature
      });
      dio.Response response=await dio.Dio().post(api,data:formData);
      return response;
    }catch(e){
      throw 'Something went wrong.Please try again';

    }
  }
}
