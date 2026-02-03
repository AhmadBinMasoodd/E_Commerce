import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get instance=>Get.find();

  final pageController=PageController();
  RxInt currentIndex=0.obs;

  void dotNavigatorClick(index){
    currentIndex.value=index;
    pageController.jumpToPage(index);
  }
  void updatePageIndicator(index){
    currentIndex.value=index;
  }
  void nextPage(){
    if(currentIndex.value==2){
      return;
    }
    currentIndex.value++;
    pageController.jumpToPage(currentIndex.value);

  }
  void skipPage(){
    currentIndex.value==2;
    pageController.jumpToPage(2);
  }
}
