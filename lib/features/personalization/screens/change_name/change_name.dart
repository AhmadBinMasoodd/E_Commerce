import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/features/personalization/controllers/change_name_controller.dart';
import 'package:e_commerce/utils/constants/Sizes.dart';
import 'package:e_commerce/utils/constants/text.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(ChangeNameController());
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'Update Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Update your name to keep your profile accurate and personalized',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: USizes.spaceBtwItems),
              Form(
                key: controller.updateUserFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller:controller.firstName ,
                      validator: (value) =>
                          UValidator.validateEmptyText('First Name', value),
                      decoration: InputDecoration(
                        labelText: UTexts.firstName,
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ),
                    SizedBox(height: USizes.spaceBtwInputFields),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) =>
                          UValidator.validateEmptyText('Last Name', value),
                      decoration: InputDecoration(
                        labelText: UTexts.lastName,
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ),
                    SizedBox(height: USizes.spaceBtwInputFields),
                  ],
                ),
              ),
              SizedBox(height: USizes.spaceBtwSections),
              UElevatedButton(onPressed: controller.updateUserName, child: Text('Save')),
            ],
          ),
        ),
      ),
    );
  }
}
