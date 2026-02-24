import 'package:e_commerce/data/repositories/category/category_repository.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  static CategoryController get find=>Get.find();

  ///variable
  final _repository=Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories=<CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories=<CategoryModel>[].obs;
  RxBool isCategoryLoading=false.obs;


  @override
  void onInit() {
    fetchCategory();
    super.onInit();
  }

  Future<void> fetchCategory()async{
    try{
      isCategoryLoading.value=true;
      List<CategoryModel> categories=await _repository.getAllCategories();
      allCategories.assignAll(categories);
      featuredCategories.assignAll(categories.where((category)=>category.isFeatured && category.parentId.isEmpty));

    }catch(e){
      USnackBarHelpers.errorSnackBar(title: 'Failed',message: e.toString());
    }finally{
      isCategoryLoading.value=false;
    }
  }

}