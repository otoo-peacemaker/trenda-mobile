import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';

class AppDecoration {
  // B decorations
  static BoxDecoration get bg => BoxDecoration(
        color: appThemeColors.whiteA700,
      );

  // Outline decorations
  static BoxDecoration get outlineBlueGray => BoxDecoration(
        color: appThemeColors.blueGray700,
        boxShadow: [
          BoxShadow(
            color: appThemeColors.blueGray70014,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              8,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineOnErrorContainer => BoxDecoration(
        border: Border.all(
          color: appThemeData.colorScheme.onErrorContainer,
          width: 1.h,
        ),
      );
  // Gradient decorations
  static BoxDecoration get gradientPrimaryToPrimary => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.5, 1.04),
          end: const Alignment(0.5, 0.01),
          colors: [
            appThemeData.colorScheme.primary.withOpacity(1),
            appThemeData.colorScheme.onError,
            appThemeData.colorScheme.primary.withOpacity(0),
          ],
        ),
      );

  // White decorations
  static BoxDecoration get white => BoxDecoration(
        color: appThemeColors.whiteA70001,
      );
}

class BorderRadiusStyle {
  // Rounded borders
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
