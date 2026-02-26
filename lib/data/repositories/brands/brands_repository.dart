import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/services/CloudinaryServices.dart';
import 'package:e_commerce/features/shop/models/brands_model.dart';
import 'package:e_commerce/utils/constants/keys.dart';
import 'package:e_commerce/utils/helpers/helpers_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BrandsRepository extends GetxController{
  static BrandsRepository get instance => Get.find();

  ///variables
  final _db=FirebaseFirestore.instance;
  final _cloudinaryServices=CloudinaryServices.instance;
/// [Upload] function to upload all brands

  Future<void> uploadBrands(List<BrandModel> brands)async{
    try{
      for(BrandModel brand in brands){
        File image=await UHelperFunctions.assetToFile(brand.image);
        dio.Response response=await _cloudinaryServices.uploadImage(image, UKeys.brandsFolder);
        if(response.statusCode==200){
          brand.image=response.data['url'];
        }
        _db.collection(UKeys.brandsCollection).doc(brand.id).set(brand.toJson());
        print('Brands ${brand.name} uploaded');
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
/// [Fetch] function to fetch all brands
  Future< List<BrandModel>> fetchBrands()async{
    try{
      final query=await _db.collection(UKeys.brandsCollection).get();
      if(query.docs.isNotEmpty){
        final brands=query.docs.map((brand) => BrandModel.fromSnapShot(brand)).toList();
        return brands;
      }
      return [];
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