import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/Sizes.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/helpers/helpers_function.dart';
import 'package:flutter/material.dart';
class UBillingPaymentSection extends StatelessWidget {
  const UBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark=UHelperFunctions.isDarkMode(context);
    return  Column(
      children: [
        USectionHeading(category: 'Payment Method',buttonTitle: 'Change',onPressed: (){},),
        SizedBox(height: USizes.spaceBtwItems/2,),

        Row(
          children: [
            URoundedContainer(
              width: 65,
              height: 35,
              backgroundColor: dark? UColors.light:UColors.white,
              padding: EdgeInsets.all(USizes.sm),
              child: Image(image: AssetImage(UImages.masterCard),fit: BoxFit.contain,),
            ),
            SizedBox(width: USizes.spaceBtwItems/2,),
            Text('Google Pay',style: Theme.of(context).textTheme.bodyLarge,)
          ],
        )
      ],
    );
  }
}

