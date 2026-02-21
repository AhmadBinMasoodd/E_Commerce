import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/personalization/screens/change_name/change_name.dart';
import 'package:e_commerce/features/personalization/screens/edit_profile/widgets/user_profile_with_edit_icon.dart';
import 'package:e_commerce/utils/constants/Sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../controllers/user_controller.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'Edit Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              /// user profile with edit icons
              UserProfileWithEditIcon(),

              /// divider
              SizedBox(height: USizes.spaceBtwSections),
              Divider(),
              SizedBox(height: USizes.spaceBtwItems),

              //account setting headings
              USectionHeading(
                category: 'Account Setting',
                showActionButton: false,
              ),
              SizedBox(height: USizes.spaceBtwItems),


              UserDetailRow(title: 'Name',value: controller.user.value.fullName,onTap: ()=>Get.to(()=>ChangeNameScreen()),),
              UserDetailRow(title: 'Username',value: controller.user.value.username,onTap: (){},),

              Divider(),
              SizedBox(height: USizes.spaceBtwItems),

              //profile section
              USectionHeading(
                category: 'Profile Setting',
                showActionButton: false,
              ),
              SizedBox(height: USizes.spaceBtwItems),
              UserDetailRow(title: 'User ID',value: controller.user.value.id,onTap: (){},),
              UserDetailRow(title: 'Email',value: controller.user.value.email,onTap: (){},),
              UserDetailRow(title: 'Phone NUmber',value: '+92 ${controller.user.value.phoneNumber}',onTap: (){},),
              UserDetailRow(title: 'Gender',value: 'Male',onTap: (){},),

              ///divider
              Divider(),
              SizedBox(height: USizes.spaceBtwItems),
              //close account button
              TextButton(onPressed: controller.deleteAccountWarningPopup, child: Text('Close Account',style: TextStyle(color: Colors.red),))



            ],
          ),
        ),
      ),
    );
  }
}

class UserDetailRow extends StatelessWidget {
  const UserDetailRow({
    super.key,
    required this.title,
    required this.value,
    this.icon=Iconsax.arrow_right,
    required this.onTap
  });
  final String title,value;
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: USizes.spaceBtwItems/1.5),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 1,
              child: Icon(icon, size: USizes.iconSm),
            ),
          ],
        ),
      ),
    );
  }
}
