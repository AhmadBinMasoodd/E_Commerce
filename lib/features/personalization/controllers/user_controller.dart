
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
  static UserController get instance=>Get.find();

  final _userRepository=Get.put(UserRepository());
  Rx<UserModel> user=UserModel.empty().obs;
  RxBool profileLoading=false.obs;

  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

  Future<void> fetchUserRecord()async{
    try{
      profileLoading.value=true;
      UserModel user=await _userRepository.fetchUserDetails();
      this.user(user);
    }catch(e){
      user(UserModel.empty());
    }finally{
      profileLoading.value=false                  ;
    }
  }
}