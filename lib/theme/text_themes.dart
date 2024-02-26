import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';

/// Class containing the supported text theme styles.
/// w100: Thin, the thinnest font weight.
// w200: Extra light.
// w300: Light.
// w400: Normal. The constant FontWeight.normal is an alias for this value.
// w500: Medium.
// w600: Semi-bold.
// w700: Bold. The constant FontWeight.bold is an alias for this value.
// w800: Extra-bold.
// w900: Black, the thickest font weight
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        displaySmall: TextStyle(
          color: colorScheme.onErrorContainer,
          fontSize: 8.fSize,
          fontFamily: 'Gilroy-Medium',
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 10.fSize,
          fontFamily: 'Gilroy-Medium',
          fontWeight: FontWeight.w400,
        ),
        displayLarge: TextStyle(
          color: colorScheme.onErrorContainer,
          fontSize: 12.fSize,
          fontFamily: 'Gilroy-Medium',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appThemeColors.gray400,
          fontSize: 14.fSize,
          fontFamily: 'Gilroy-Medium',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appThemeColors.gray400,
          fontSize: 16.fSize,
          fontFamily: 'Gilroy-Medium',
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: TextStyle(
          color: colorScheme.onPrimaryContainer,
          fontSize: 18.fSize,
          fontFamily: 'Gilroy-Regular',
          fontWeight: FontWeight.w400,
        ),
        titleSmall: TextStyle(
          color: colorScheme.primary,
          fontSize: 20.fSize,
          fontFamily: 'Gilroy-Regular',
          fontWeight: FontWeight.w400,
        ),
        titleMedium: TextStyle(
          color: colorScheme.primary,
          fontSize: 22.fSize,
          fontFamily: 'Gilroy-Medium',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: colorScheme.primary,
          fontSize: 24.fSize,
          fontFamily: 'Gilroy-Bold',
          fontWeight: FontWeight.w700,
        ),
      );
}
