import 'package:flutter/material.dart';

/// Class containing the supported color schemes.
class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0xFF005127),
    // primary: Color(0X0C45F599),
    primaryContainer: Color(0XFFEA4335),
    // Error colors
    errorContainer: Color(0XFF1D2838),
    onErrorContainer: Color(0XFFCFD4DC),
    onSurface: Color(0X0C101828),
    // On colors(text colors)
    onPrimary: Color(0X0C45F599),
    onPrimaryContainer: Color(0XFF0F1728),
  );

  static const primaryDarkColorScheme = ColorScheme.dark(
    // Primary colors
    primary: Color(0X0C101828),
    primaryContainer: Color(0XFFEA4335),

    onSurface: Color(0X0C101828),

    // Error colors
    errorContainer: Color(0XFF1D2838),
    onErrorContainer: Color(0XFFCFD4DC),

    // On colors(text colors)
    onPrimary: Color(0XFF98A1B2),
    onPrimaryContainer: Color(0XFF0F1728),
  );
}
