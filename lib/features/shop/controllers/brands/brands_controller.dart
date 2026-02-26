import 'package:e_commerce/data/repositories/brands/brands_repository.dart';
import 'package:e_commerce/features/shop/models/brands_model.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';

class BrandsController extends GetxController {
  static BrandsController get instance => Get.find();

  ///variables
  final _repository = Get.put(BrandsRepository());
  RxList<BrandModel> allBrands = <BrandModel>[].obs;
  RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  RxBool isLoading=false.obs;

  @override
  void onInit() {
    fetchBrands();
    super.onInit();
  }

  Future<void> fetchBrands() async {
    try {
      isLoading.value=true;
      List<BrandModel> brands = await _repository.fetchBrands();
      allBrands.assignAll(brands);
      featuredBrands.assignAll(
        allBrands.where((brand) => brand.isFeatured ?? false).toList(),
      );
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Failed', message: e.toString());
    }finally{
      isLoading.value=false;
    }
  }
}
