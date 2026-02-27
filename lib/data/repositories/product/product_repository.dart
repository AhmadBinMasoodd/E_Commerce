import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/services/CloudinaryServices.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
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


    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on UPlatformException catch (e) {
      throw UFirebaseException(e.code).message;
    } catch (e) {
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