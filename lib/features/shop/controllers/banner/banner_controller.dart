import 'package:carousel_slider/carousel_controller.dart';
import 'package:e_commerce/data/repositories/banners/banners_repository.dart';
import 'package:e_commerce/features/shop/models/banner_model.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  ///variables
  final _repository = Get.put(BannersRepository());
  RxList<BannerModel> banners = <BannerModel>[].obs;
  RxBool isBannerLoading=false.obs;
  final carouselController=CarouselSliderController();
  RxInt currentIndex=0.obs;
  @override
  void onInit() {
    //
    fetchBanners();
    super.onInit();
  }
  void onPageChanged(int index){
    currentIndex.value=index;
  }

  Future<void> fetchBanners() async {
    try {
      isBannerLoading.value=true;
      List<BannerModel> banner=await _repository.fetchActiveBanners();
      banners.assignAll(banner);

    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Failed', message: e.toString());
    }finally{
      isBannerLoading.value=false;

    }
  }
}
