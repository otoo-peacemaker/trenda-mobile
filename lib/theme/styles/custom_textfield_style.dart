import 'dart:ui';

import 'package:trenda/core/app_export.dart';

class CustomTextFieldStyle {
  static get inputTextStyle => appThemeData.textTheme.bodyMedium?.copyWith(
        height: 0.9.h,
        color: appThemeColors.blueGray800,
      );
  static get helperStyle => appThemeData.textTheme.displayLarge?.copyWith(
        height: 0.12.h,
        color: const Color(0xFF475466),
      );
  static get labelStyle => appThemeData.textTheme.displayLarge?.copyWith(
        height: 0.12.h,
        color: const Color(0xFF667084),
      );

  //const Color(0xFF667084),
  static get hintStyle => appThemeData.textTheme.bodySmall?.copyWith(
        height: 0.10.h,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF98A1B2),
      );
  static get errorStyle => appThemeData.textTheme.bodyMedium?.copyWith(
        height: 0.9.h,
        color: appThemeColors.blueGray800,
      );
}
