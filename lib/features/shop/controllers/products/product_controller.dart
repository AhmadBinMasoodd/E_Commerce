import 'package:e_commerce/data/repositories/product/product_repository.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';


class ProductController extends GetxController{
  static ProductController get instance=>Get.find();


  ///variables
  final _repository=Get.put(ProductRepository());
  RxList<ProductModel> featuredProduct=<ProductModel>[].obs;
  RxBool isLoading=false.obs;

  @override
  void onInit() {
    getFeaturedProduct();
    super.onInit();
  }

  Future<void> getFeaturedProduct()async{
    try{
      isLoading.value=true;
      List<ProductModel> featureProduct=await _repository.getFeaturedProducts();
      featuredProduct.assignAll(featureProduct);


    }catch(e){

      USnackBarHelpers.errorSnackBar(title: "Failed!",message: e.toString());
    }finally{
      isLoading.value=false;
    }
  }

}