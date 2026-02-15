import 'package:flutter/material.dart';

import '../../../../../utils/constants/Sizes.dart';

class UBillingAmountSection extends StatelessWidget {
  const UBillingAmountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [

            //order fee
            Text(
              'Subtotal',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Spacer(),
            Text(
              '\$343',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(height: USizes.spaceBtwSections / 2),

        ///shipping fee
        Row(
          children: [
            Text(
              'Shipping Fee',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Spacer(),
            Text(
              '\$34',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        SizedBox(height: USizes.spaceBtwSections / 2),
        Row(
          children: [
            Text(
              'Tax Fee',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Spacer(),
            Text(
              '\$4',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        SizedBox(height: USizes.spaceBtwSections / 2),
        Row(
          children: [
            Text(
              'Order Total Fee',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Spacer(),
            Text(
              '\$34',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ],
    );
  }
}
