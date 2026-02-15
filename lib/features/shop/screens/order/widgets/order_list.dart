import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/utils/constants/Sizes.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helpers_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UOrderListItems extends StatelessWidget {
  const UOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return ListView.separated(itemBuilder: (context, index) =>
        URoundedContainer(
          showBorder: true,
          backgroundColor: dark ? UColors.dark : UColors.light,
          padding: EdgeInsets.all(USizes.md),
          child: Column(
            children: [
              //// 1st row
              Row(
                children: [
                  //icon
                  Icon(Iconsax.ship),
                  SizedBox(width: USizes.spaceBtwItems / 2),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //title
                      Text(
                        'Processing',
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(
                          color: UColors.primary,
                          fontWeightDelta: 1,
                        ),
                      ),

                      ///date
                      Text(
                        '01 jan 2026',
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall,
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Iconsax.arrow_right)),
                ],
              ),
              SizedBox(height: USizes.spaceBtwItems,),

              ///2nd row
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [

                        ///tag icon
                        Icon(Iconsax.tag),
                        SizedBox(width: USizes.spaceBtwItems / 2),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            //order
                            Text('Order', style: Theme
                                .of(context)
                                .textTheme
                                .labelMedium),
                            //order id
                            Text(
                              '[#989525]',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium,
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Row(
                      children: [

                        ///calender icon
                        Icon(Iconsax.calendar),
                        SizedBox(width: USizes.spaceBtwItems / 2),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            ///shipping heading
                            Text('Shipping Date', style: Theme
                                .of(context)
                                .textTheme
                                .labelMedium),

                            ///shipping date
                            Text(
                              '3 Jan 2026',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium,
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        separatorBuilder: (context, index) =>
            SizedBox(width: USizes.spaceBtwItems,),
        itemCount: 10);
  }
}
