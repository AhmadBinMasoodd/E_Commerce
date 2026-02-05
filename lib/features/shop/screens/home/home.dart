import 'package:e_commerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/primary_header_container.dart';
import 'package:e_commerce/utils/constants/Sizes.dart';


import 'package:flutter/material.dart';

import '../../../../common/widgets/text_fields/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(height: USizes.homePrimaryHeaderHeight + 10),
          UPrimaryHeaderContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UHomeAppbar(),
                SizedBox(height: USizes.spaceBtwSections),
                UHomeCategories()
              ],
            ),
          ),
          USearchedBar(),
        ],
      ),
    );
  }
}

