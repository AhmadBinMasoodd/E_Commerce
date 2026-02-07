import 'package:flutter/material.dart';

class USectionHeading extends StatelessWidget {
  const USectionHeading({
    super.key,
    required this.category, required this.onPressed,this.buttonTitle="View all"
  });
  final String category,buttonTitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(category,style: Theme.of(context).textTheme.headlineSmall,overflow: TextOverflow.ellipsis,),
        TextButton(onPressed: onPressed, child: Text(buttonTitle,style: Theme.of(context).textTheme.labelMedium,)),
      ],
    );
  }
}
