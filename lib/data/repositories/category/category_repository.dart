import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/services/CloudinaryServices.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/utils/constants/keys.dart';
import 'package:e_commerce/utils/helpers/helpers_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  ///variables
  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices=CloudinaryServices.instance;

  /// [uploadCategory] function to upload the list of categories
  Future<void> uploadCategory(List<CategoryModel> categories)async{
    try{
      for(final category in categories){
        File file=await UHelperFunctions.assetToFile(category.image);
        dio.Response response=await _cloudinaryServices.uploadImage(file, UKeys.categoryFolder);
        if(response.statusCode==200){
          category.image=response.data['url'];
        }

        await _db.collection(UKeys.categoryCollection).doc(category.id).set(category.toJson());
      }

    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on UPlatformException catch (e) {
      throw UFirebaseException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }
  /// [FetchCategories] function to fetch the list of categories
  Future<List<CategoryModel>> getAllCategories()async{
    try{
      final query = await _db.collection(UKeys.categoryCollection).get();
      if(query.docs.isNotEmpty){
        List<CategoryModel> categories=query.docs.map((document)=>CategoryModel.fromSnapshot(document)).toList();
        return categories;
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
