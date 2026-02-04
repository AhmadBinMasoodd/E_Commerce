import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helpers_function.dart';

class UFormDevider extends StatelessWidget {
  const UFormDevider({
    super.key,
    required this.text
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    final bool isDark=UHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Expanded(child: Divider(indent: 60,endIndent: 5,thickness: 0.5,color: isDark? UColors.darkGrey:UColors.dark,)),
        Text(this.text,style: Theme.of(context).textTheme.labelMedium,),
        Expanded(child: Divider(indent: 5,endIndent: 60,thickness: 0.5,color: isDark? UColors.darkGrey:UColors.dark,)),
      ],
    );
  }
}
