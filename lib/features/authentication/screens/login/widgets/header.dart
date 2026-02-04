import 'package:flutter/material.dart';

import '../../../../../utils/constants/Sizes.dart';
import '../../../../../utils/constants/text.dart';

class UloginHeader extends StatelessWidget {
  const UloginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          UTexts.loginTile,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: USizes.sm),
        Text(
          UTexts.loginSubtitle,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
