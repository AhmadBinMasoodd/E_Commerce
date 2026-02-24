import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/services/CloudinaryServices.dart';
import 'package:e_commerce/features/shop/models/banner_model.dart';
import 'package:e_commerce/utils/constants/keys.dart';
import 'package:e_commerce/utils/helpers/helpers_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
class BannersRepository extends GetxController{
  static BannersRepository get instance=>Get.find();

  ///variables
  final _db=FirebaseFirestore.instance;
  final cloudinaryServices=CloudinaryServices.instance;


  ///[UploadBanners] function to upload the banners
  Future<void> uploadBanners(List<BannerModel> banners)async{
    try{
      for(BannerModel banner in banners){
        File image=await UHelperFunctions.assetToFile(banner.imageUrl);
        dio.Response response= await cloudinaryServices.uploadImage(image, UKeys.bannersFolder);
        if(response.statusCode==200){
          banner.imageUrl=response.data['url'];
        }
        await _db.collection(UKeys.bannersCollection).doc().set(banner.toJson());
        print('Banners Uploaded: ${banner.targetScreen}');
      }
    }on FirebaseAuthException catch (e) {
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