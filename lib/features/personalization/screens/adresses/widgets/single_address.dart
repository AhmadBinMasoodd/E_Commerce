import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helpers_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/rounded_container.dart';
import '../../../../../utils/constants/Sizes.dart';

class USingleAddress extends StatelessWidget {
  const USingleAddress({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final bool dark=UHelperFunctions.isDarkMode(context);
    return URoundedContainer(
      width: double.infinity,
      showBorder: true,
      borderColor: isSelected ? Colors.transparent :dark? UColors.darkerGrey:UColors.grey,
      backgroundColor: isSelected
          ? UColors.primary.withValues(alpha: 0.5)
          : Colors.transparent,
      padding: EdgeInsets.all(USizes.md),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Unknown',
                style: Theme.of(context).textTheme.titleLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: USizes.spaceBtwItems/2,),
              Text(
                '+92 33333333',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: USizes.spaceBtwItems/2,),

              Text(
                'Chak no 5Sb Bhalwal District Sargodha',
              ),
            ],
          ),

         if(isSelected) Positioned(
            top: 0,
            bottom: 0,
            right: 4,
            child: Icon(Iconsax.tick_circle5),
          ),
        ],
      ),
    );
  }
}
