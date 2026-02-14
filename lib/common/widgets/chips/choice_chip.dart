import 'package:e_commerce/common/widgets/custom_shapes/circular_container.dart';
import 'package:e_commerce/utils/helpers/helpers_function.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class UChoiceChip extends StatelessWidget {
  const UChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    required this.onSlected,
  });

  final String text;
  final bool selected;
  final Function(bool) onSlected;

  @override
  Widget build(BuildContext context) {
    final bool isColor = UHelperFunctions.getColor(text) != null;
    return ChoiceChip(
      label: isColor ? SizedBox() : Text(text),
      selected: selected,
      onSelected: onSlected,
      labelStyle: TextStyle(color: selected ? UColors.white : null),
      shape: isColor ? CircleBorder() : null,
      padding: isColor ? EdgeInsets.zero : null,
      labelPadding: isColor ? EdgeInsets.zero : null,
      avatar: isColor
          ? UCircularContainer(
              width: 50,
              height: 50,
              backgroundColor: UHelperFunctions.getColor(text)!,
            )
          : null,
      backgroundColor: isColor ? UHelperFunctions.getColor(text) : null,
    );
  }
}
