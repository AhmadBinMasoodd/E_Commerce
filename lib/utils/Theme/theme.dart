import 'package:e_commerce/utils/Theme/widgets_theme/appbar_theme.dart';
import 'package:e_commerce/utils/Theme/widgets_theme/bottom_sheet_theme.dart';
import 'package:e_commerce/utils/Theme/widgets_theme/checkbox_theme.dart';
import 'package:e_commerce/utils/Theme/widgets_theme/chip_theme.dart';
import 'package:e_commerce/utils/Theme/widgets_theme/elevated_button_theme.dart';
import 'package:e_commerce/utils/Theme/widgets_theme/outlined_button_theme.dart';
import 'package:e_commerce/utils/Theme/widgets_theme/text_field_theme.dart';
import 'package:e_commerce/utils/Theme/widgets_theme/text_theme.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class UAppTheme {
  UAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: '',
    primaryColor: UColors.primary,
    disabledColor: UColors.grey,
    textTheme: UTextTheme.lightTextTheme,
    scaffoldBackgroundColor: UColors.white,
    chipTheme: UChipTheme.lightChipTheme,
    appBarTheme: UAppBarTheme.lightAppBarTheme,
    checkboxTheme: UCheckboxTheme.lightCheckboxTheme,
    elevatedButtonTheme: UElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: UOutlinedButtonTheme.lightOutlinedButtonTheme,
    bottomSheetTheme: UBottomSheetTheme.lightBottomSheetTheme,
    inputDecorationTheme: UTextFormFieldTheme.lightInputDecorationTheme
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: '',
    brightness: Brightness.dark,
    textTheme: UTextTheme.darkTextTheme,
    primaryColor: UColors.primary,
    disabledColor: UColors.grey,
    scaffoldBackgroundColor: UColors.black,
    chipTheme: UChipTheme.darkChipTheme,
    appBarTheme: UAppBarTheme.darkAppBarTheme,
    checkboxTheme: UCheckboxTheme.darkCheckboxTheme,
    elevatedButtonTheme: UElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: UOutlinedButtonTheme.darkOutlinedButtonTheme,
    bottomSheetTheme: UBottomSheetTheme.darkBottomSheetTheme,
    inputDecorationTheme: UTextFormFieldTheme.darkInputDecorationTheme,
  );

}
