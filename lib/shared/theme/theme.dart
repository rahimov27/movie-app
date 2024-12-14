import 'package:flutter/material.dart';
import 'package:movie_app/shared/theme/app_colors.dart';

ThemeData theme = ThemeData(
    fontFamily: "Kanit-Regular",
    appBarTheme: const AppBarTheme(color: AppColors.splashBlackColor),
    scaffoldBackgroundColor: AppColors.splashBlackColor,
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: AppColors.yellow,
      cursorColor: AppColors.yellow,
      selectionHandleColor: AppColors.yellow,
    ));
