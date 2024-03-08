import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import 'package:trenda/theme/theme_helper.dart';

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

  // Fill decorations
  static BoxDecoration get fillCyan => BoxDecoration(
        color: appThemeColors.cyan50,
      );
  static BoxDecoration get fillErrorContainer => BoxDecoration(
        color: appThemeData.colorScheme.errorContainer,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appThemeColors.gray100,
      );
  static BoxDecoration get fillGray90028 => BoxDecoration(
        color: appThemeColors.gray90028,
      );
  static BoxDecoration get fillGrayE => BoxDecoration(
        color: appThemeColors.gray4001e,
      );
  static BoxDecoration get fillGreenA => BoxDecoration(
        color: appThemeColors.greenA40001,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appThemeColors.whiteA70001.withOpacity(0.8),
      );
  static BoxDecoration get fillYellow => BoxDecoration(
        color: appThemeColors.yellow800,
      );

  static BoxDecoration get outlineBluegray50 => BoxDecoration(
        color: appThemeColors.blueGray800,
        border: Border(
          bottom: BorderSide(
            color: appThemeColors.blueGray50,
            width: 1.h,
          ),
        ),
      );
  static BoxDecoration get outlineBluegray501 => BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: appThemeColors.blueGray50,
            width: 1.h,
          ),
        ),
      );
  static BoxDecoration get outlineBluegray502 => BoxDecoration(
        border: Border(
          top: BorderSide(
            color: appThemeColors.blueGray50,
            width: 1.h,
          ),
          bottom: BorderSide(
            color: appThemeColors.blueGray50,
            width: 1.h,
          ),
        ),
      );
  static BoxDecoration get outlineBluegray70014 => BoxDecoration(
        color: appThemeColors.blueGray800,
        boxShadow: [
          BoxShadow(
            color: appThemeColors.blueGray70014,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              8,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineGray => BoxDecoration(
        color: appThemeColors.whiteA70001,
        border: Border.all(
          color: appThemeColors.gray100,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineGray100 => BoxDecoration(
        border: Border.all(
          color: appThemeColors.gray100,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo => BoxDecoration(
        color: appThemeColors.teal50,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo50 => BoxDecoration(
        color: appThemeColors.teal100,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo501 => BoxDecoration(
        color: appThemeColors.teal200,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo5010 => BoxDecoration(
        color: appThemeColors.greenA100,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo5011 => BoxDecoration(
        color: appThemeColors.greenA20002,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo5012 => BoxDecoration(
        color: appThemeColors.greenA200,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo5013 => BoxDecoration(
        color: appThemeColors.tealA400,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo5014 => BoxDecoration(
        color: appThemeColors.greenA400,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo5015 => BoxDecoration(
        color: appThemeColors.greenA40001,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo5016 => BoxDecoration(
        color: appThemeColors.greenA700,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo5017 => BoxDecoration(
        color: appThemeColors.teal80001,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo5018 => BoxDecoration(
        color: appThemeColors.teal900,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo5019 => BoxDecoration(
        color: appThemeColors.yellow50,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo502 => BoxDecoration(
        color: appThemeColors.teal300,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo5020 => BoxDecoration(
        color: appThemeColors.yellow100,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo5021 => BoxDecoration(
        color: appThemeColors.amber100,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo5022 => BoxDecoration(
        color: appThemeColors.yellow200,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo5023 => BoxDecoration(
        color: appThemeColors.amberA100,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo5024 => BoxDecoration(
        color: appThemeData.colorScheme.onErrorContainer,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo5025 => BoxDecoration(
        color: appThemeColors.amber300,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo5026 => BoxDecoration(
        color: appThemeColors.lime700,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo5027 => BoxDecoration(
        color: appThemeColors.lime90001,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo5028 => BoxDecoration(
        color: appThemeColors.lime900,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo503 => BoxDecoration(
        color: appThemeColors.teal30001,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo504 => BoxDecoration(
        color: appThemeColors.teal50001,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo505 => BoxDecoration(
        color: appThemeColors.teal500,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo506 => BoxDecoration(
        color: appThemeData.colorScheme.primaryContainer,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo507 => BoxDecoration(
        color: appThemeColors.teal800,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo508 => BoxDecoration(
        color: appThemeColors.teal90001,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo509 => BoxDecoration(
        color: appThemeColors.cyan50,
        border: Border.all(
          color: appThemeColors.indigo50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineOnError => BoxDecoration(
        color: appThemeColors.greenA20001,
        boxShadow: [
          BoxShadow(
            color: appThemeData.colorScheme.onError,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              1,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineWhiteA => BoxDecoration(
        border: Border.all(
          color: appThemeColors.whiteA70001,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineWhiteA70001 => BoxDecoration(
        color: appThemeColors.pink70028,
        border: Border.all(
          color: appThemeColors.whiteA70001,
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder25 => BorderRadius.circular(
        25.h,
      );
  static BorderRadius get circleBorder28 => BorderRadius.circular(
        28.h,
      );
  static BorderRadius get circleBorder40 => BorderRadius.circular(
        40.h,
      );
  static BorderRadius get circleBorder7 => BorderRadius.circular(
        7.h,
      );

  // Rounded borders
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12.h,
      );
  static BorderRadius get roundedBorder4 => BorderRadius.circular(
        4.h,
      );

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
