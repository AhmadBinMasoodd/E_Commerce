import 'package:flutter/material.dart';

import '../../../../../common/widgets/imageText/vertical_image_text.dart';
import '../../../../../utils/constants/Sizes.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/text.dart';

class UHomeCategories extends StatelessWidget {
  const UHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: USizes.spaceBtwSections),
      child: Column(
        children: [
          Text(
            UTexts.homeCategories,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium!.apply(color: UColors.white),
          ),
          SizedBox(height: USizes.spaceBtwItems),
          SizedBox(
            height: 80,
            child: ListView.separated(
              separatorBuilder:(context, index) => SizedBox(width: USizes.spaceBtwItems,) ,
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return UVerticalImageText(
                  title: "Sports Category",
                  image: UImages.sportsIcon,
                  textColor: UColors.white,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

