import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helpers_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigatorController());
    bool isDark=UHelperFunctions.isDarkMode(context);
    return Scaffold(
      body:Obx(()=> controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          elevation: 0,
          backgroundColor:isDark?  UColors.dark:UColors.light,
          indicatorColor:isDark? UColors.light.withValues(alpha: 0.1):UColors.black.withValues(alpha: 0.1),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) {
            controller.selectedIndex.value = index;
          },
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

class NavigatorController extends GetxController {
  RxInt selectedIndex = 0.obs;
  List<Widget> screens=[HomeScreen(),Container(color: Colors.black,),Container(color: Colors.green,),Container(color: Colors.blue,)];
}
