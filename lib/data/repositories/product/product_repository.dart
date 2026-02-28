import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/services/CloudinaryServices.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/helpers/helpers_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;
import '../../../utils/constants/keys.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController{
  static ProductRepository get instance=>Get.find();

  final _db=FirebaseFirestore.instance;
  final _cloudinaryServices=CloudinaryServices.instance;

  /// [uploadProducts] function to upload the list of products
  Future<void> uploadProducts(List<ProductModel> products)async{
    try{
      for(ProductModel product in products){
        File thumbnailFile=await UHelperFunctions.assetToFile(product.thumbnail);
        dio.Response response=await _cloudinaryServices.uploadImage(thumbnailFile, UKeys.productsFolder);
        if(response.statusCode==200){
          product.thumbnail=response.data['url'];
        }
        if(product.images!=null&&product.images!.isNotEmpty){
          List<String> imagesUrls=[];

          /// [uploadImages] one by one
          for(String image in product.images!){
            File imageFile=await UHelperFunctions.assetToFile(image);
            dio.Response response=await _cloudinaryServices.uploadImage(imageFile, UKeys.productsFolder);
            if(response.statusCode==200){
              imagesUrls.add(response.data['url']);
            }
            // for(final variation in product.productVariations!){
            //   int index=product.images!.indexWhere((element)=>element==variation.image);
            //   variation.image=imagesUrls[index];
            // }
          }

          product.images!
            ..clear()
            ..addAll(imagesUrls);
        }

        await _db.collection(UKeys.productCollection).doc(product.id).set(product.toJson());
        print('Product Uploaded ${product.id}');
      }

    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on UPlatformException catch (e) {
      throw UFirebaseException(e.code).message;
    } catch (e,s) {
      print('Error message ${s}');
      throw "Something went wrong. Please try again";
    }
  }
  /// [FetchProducts] function to fetch the list of products
  Future<List<ProductModel>> getAllProducts()async{
    try{

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