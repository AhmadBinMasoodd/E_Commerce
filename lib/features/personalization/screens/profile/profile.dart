import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/profile_primary_header.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/settings_menu_tile.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/user_profile_tile.dart';
import 'package:e_commerce/utils/constants/Sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            UProfilePrimaryHeader(),

            Padding(
              padding: const EdgeInsets.all(USizes.defaultSpace),
              child: Column(
                children: [
                  ///user profile details
                  UserProfileTile(),
                  SizedBox(height: USizes.spaceBtwItems),
                  //account setting heading
                  USectionHeading(
                    category: 'Account Settings',
                    onPressed: () {},
                    showActionButton: false,
                  ),
                  SizedBox(height: USizes.spaceBtwItems),

                  //setting menu
                  SettingMenuTile(
                    title: 'My Addresses',
                    subtitle: 'Set shopping delivery addresses',
                    icon: Icon(Iconsax.safe_home),
                  ),
                  SettingMenuTile(
                    title: 'My Cart',
                    subtitle: 'Add, remove products and move to checkout',
                    icon: Icon(Iconsax.shopping_cart),
                  ),
                  SettingMenuTile(
                    title: 'Orders',
                    subtitle: 'In progress and completed orders',
                    icon: Icon(Iconsax.bag_tick),
                  ),
                  SizedBox(height: USizes.spaceBtwSections),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text('Logout'),
                    ),
                  ),
                  SizedBox(height: USizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
