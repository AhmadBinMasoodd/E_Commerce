import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/Sizes.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class UBillingAddressSection extends StatelessWidget {
  const UBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        USectionHeading(category: 'Billing Address',buttonTitle: 'Change',onPressed: (){},),
        Text('Unknown',style: Theme.of(context).textTheme.titleLarge,),
        SizedBox(width: USizes.spaceBtwItems,),

        Row(
          children: [
            Icon(Icons.phone,size: USizes.iconSm,color: UColors.darkGrey,),
            SizedBox(width: USizes.spaceBtwItems,),
            Text('+92 321654987'),
          ],
        ),
        SizedBox(width: USizes.spaceBtwItems/2,),

        Row(
          children: [
            Icon(Icons.location_history,size: USizes.iconSm,color: UColors.darkGrey,),
            SizedBox(width: USizes.spaceBtwItems,),
            Expanded(child: Text('Bhalwal district sargodha',softWrap: true,)),
          ],
        )
      ],
    );
  }
}
