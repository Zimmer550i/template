import 'package:flutter/material.dart';
import 'package:template/utils/app_colors.dart';

ThemeData dark() => ThemeData(
  fontFamily: "Lato",
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.gray.shade900,
  colorScheme: ColorScheme.dark(
    primary: AppColors.green,
    secondary: AppColors.green.shade300,
    surface: AppColors.gray.shade800,
  ),
);
