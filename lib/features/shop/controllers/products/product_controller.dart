import 'package:e_commerce/data/repositories/product/product_repository.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/enum.dart';
import 'package:e_commerce/utils/constants/text.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  ///variables
  final _repository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProduct = <ProductModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getFeaturedProduct();
    super.onInit();
  }

  Future<void> getFeaturedProduct() async {
    try {
      isLoading.value = true;
      List<ProductModel> featureProduct = await _repository
          .getFeaturedProducts();
      featuredProduct.assignAll(featureProduct);
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: "Failed!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  ///calculate sales percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) {
      return null;
    }
    if (originalPrice <= 0.0) {
      return null;
    }
    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(1);
  }

  String getProductprice(ProductModel product){
    double largestPrice=0.0;
    double smallestPrice=double.infinity;
    if(product.productType==ProductType.single.toString()){
      return product.salePrice>0? product.salePrice.toString():product.price.toString();
    }
    else{

      //calculate the smallest and largest price among the variations
      for(final variation in product.productVariations!){
        double variationPrice=variation.salePrice>0?variation.salePrice:variation.price;

        if(variationPrice>largestPrice){
          largestPrice=variationPrice;
        }if(variationPrice<smallestPrice){
          smallestPrice=variationPrice;
        }
      }

      if(smallestPrice.isEqual(largestPrice)){
        return largestPrice.toStringAsFixed(0);
      }
      else{
        return '${UTexts.currency}{largestPrice.toStringAsFixed(0)} -  ${UTexts.currency}${smallestPrice.toStringAsFixed(0)}';
      }
    }
  }
}
