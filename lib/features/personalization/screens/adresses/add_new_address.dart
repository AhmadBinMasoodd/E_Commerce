import 'package:e_commerce/common/styles/padding.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  UAppBar(
        showBackArrow: true,
        title: Text(
          'Add New Address ',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:UPadding.screenPadding,
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
