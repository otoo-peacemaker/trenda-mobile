import 'package:flutter/material.dart';
import '../../core/app_export.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style

  static ButtonStyle get primaryButtonStyle => ElevatedButton.styleFrom(
        backgroundColor: appThemeColors.greenA200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.h),
        ),
        textStyle: appThemeData.textTheme.bodySmall?.copyWith(
          fontSize: 16.fSize,
          color: appThemeColors.blueGray900,
        ),
      );

  static ButtonStyle get buyButtonStyle => ElevatedButton.styleFrom(
        backgroundColor: appThemeColors.blueGray800,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.h),
        ),
        textStyle: appThemeData.textTheme.bodySmall?.copyWith(
          color: appThemeColors.whiteA70001,
          height: 0.10.h,
        ),
        foregroundColor: Colors.white,
      );
  static ButtonStyle get fillGray => ElevatedButton.styleFrom(
        backgroundColor: appThemeColors.gray100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.h),
        ),
      );

  static ButtonStyle get disableButtonStyle => ElevatedButton.styleFrom(
        backgroundColor: appThemeColors.gray,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.h),
        ),
      );

  static ButtonStyle get textButtonStyle => OutlinedButton.styleFrom(
        backgroundColor: appThemeColors.whiteA700,
        textStyle: appThemeData.textTheme.bodySmall?.copyWith(
          color: appThemeColors.teal800,
        ),
      );

  //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

  // Outline button style
  static ButtonStyle get outlineGreenA => OutlinedButton.styleFrom(
        backgroundColor: appThemeColors.greenA200,
        side: BorderSide(
          color: appThemeColors.greenA200,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
      );
  static ButtonStyle get outlineGreenATL8 => OutlinedButton.styleFrom(
        backgroundColor: appThemeColors.greenA200,
        side: BorderSide(
          color: appThemeColors.greenA700,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
      );
  static ButtonStyle get outlineOnErrorContainer => OutlinedButton.styleFrom(
        backgroundColor: appThemeColors.gray5001,
        side: BorderSide(
          color: appThemeData.colorScheme.onErrorContainer,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
      );
  static ButtonStyle get outlineOnErrorContainerTL8 => OutlinedButton.styleFrom(
        backgroundColor: appThemeColors.whiteA70001,
        side: BorderSide(
          color: appThemeData.colorScheme.onErrorContainer,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
      );
  static ButtonStyle get outlinePrimary => ElevatedButton.styleFrom(
        backgroundColor: appThemeColors.whiteA70001,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
        shadowColor: appThemeData.colorScheme.primary,
        elevation: 1,
      );
  static ButtonStyle get outlineTealA => OutlinedButton.styleFrom(
        backgroundColor: appThemeColors.greenA200,
        side: BorderSide(
          color: appThemeColors.tealA400,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
