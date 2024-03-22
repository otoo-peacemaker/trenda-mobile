import '../../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  static get splashTitleTextStyle =>
      appThemeData.textTheme.titleLarge?.copyWith(
        color: Colors.white,
        fontFamily: 'Gilroy-HeavyItalic',
        fontSize: 30.fSize,
        fontStyle: FontStyle.italic,
        letterSpacing: 5.v,
        height: 0.04.h,
        fontWeight: FontWeight.w900,
      );
  static get boardingTitleTextStyle => appThemeData.textTheme.titleLarge;
  static get boardingBodyTextStyle =>
      appThemeData.textTheme.bodyMedium?.copyWith(
        fontFamily: 'Gilroy-SemiBold',
        fontWeight: FontWeight.w600,
      );

  static get headerTextStyle => appThemeData.textTheme.titleSmall?.copyWith(
        color: const Color(0xFF344053),
      );

  static get itemHeaderTextStyle => appThemeData.textTheme.bodyLarge?.copyWith(
        color: appThemeColors.greenA700,
      );

  static get footerTextStyle => appThemeData.textTheme.bodySmall?.copyWith(
        height: 0.10.h,
        fontWeight: FontWeight.w400,
        color: appThemeColors.blueGray500,
      );

  static get noticeTextStyle => appThemeData.textTheme.displayLarge?.copyWith(
        fontWeight: FontWeight.w400,
        color: appThemeColors.blueGray800,
      );

  static get noticeLinkTextStyle =>
      appThemeData.textTheme.displayLarge?.copyWith(
        height: 0.10.h,
        fontWeight: FontWeight.w400,
        color: appThemeColors.greenA700,
      );

  // Body text style
  static get bodyLargeBluegray800 => appThemeData.textTheme.bodyLarge!.copyWith(
        color: appThemeColors.blueGray800,
        fontSize: 16.fSize,
      );
  static get bodyLargeGilroyExtraBoldWhiteA70001 =>
      appThemeData.textTheme.bodyLarge!.gilroyExtraBold.copyWith(
        color: appThemeColors.whiteA70001,
      );
  static get bodyLargeGilroyMediumBluegray800 =>
      appThemeData.textTheme.bodyLarge!.gilroyMedium.copyWith(
        color: appThemeColors.blueGray800,
        fontSize: 16.fSize,
      );
  static get bodyLargeGilroyMediumErrorContainer =>
      appThemeData.textTheme.bodyLarge!.gilroyMedium.copyWith(
        color: appThemeData.colorScheme.errorContainer,
        fontSize: 16.fSize,
      );
  static get bodyLargeGilroyMediumGreenA700 =>
      appThemeData.textTheme.bodyLarge!.gilroyMedium.copyWith(
        color: appThemeColors.greenA700,
        fontSize: 16.fSize,
      );
  static get bodyLargeGilroyMediumTeal800 =>
      appThemeData.textTheme.bodyLarge!.gilroyMedium.copyWith(
        color: appThemeColors.teal800,
        fontSize: 16.fSize,
      );
  static get bodyMediumBluegray500 =>
      appThemeData.textTheme.bodyMedium!.copyWith(
        color: appThemeColors.blueGray500,
      );
  static get bodyMediumBluegray700 =>
      appThemeData.textTheme.bodyMedium!.copyWith(
        color: appThemeColors.blueGray700,
      );

  static get bodySmallBlueGray900 => appThemeData.textTheme.bodySmall!.copyWith(
        color: appThemeColors.blueGray500,
      );
  static get bodyMediumBluegray800 =>
      appThemeData.textTheme.bodyMedium!.copyWith(
        color: appThemeColors.blueGray800,
      );
  static get bodyMediumErrorContainer =>
      appThemeData.textTheme.bodyMedium!.copyWith(
        color: appThemeData.colorScheme.errorContainer,
      );
  static get bodyMediumGilroyBoldGreenA700 =>
      appThemeData.textTheme.bodyMedium!.gilroyBold.copyWith(
        color: appThemeColors.greenA700,
      );
  static get bodyMediumGilroyRegular =>
      appThemeData.textTheme.bodyMedium!.gilroyRegular;
  static get bodyMediumGilroyRegularBluegray500 =>
      appThemeData.textTheme.bodyMedium!.gilroyRegular.copyWith(
        color: appThemeColors.blueGray500,
      );
  static get bodyMediumGilroyRegularBluegray800 =>
      appThemeData.textTheme.bodyMedium!.gilroyRegular.copyWith(
        color: appThemeColors.blueGray800,
      );
  static get bodyMediumGilroyRegularErrorContainer =>
      appThemeData.textTheme.bodyMedium!.gilroyRegular.copyWith(
        color: appThemeData.colorScheme.errorContainer,
      );
  static get bodyMediumGilroyRegularGreenA700 =>
      appThemeData.textTheme.bodyMedium!.gilroyRegular.copyWith(
        color: appThemeColors.greenA700,
      );
  static get bodyMediumOnPrimary => appThemeData.textTheme.bodyMedium!.copyWith(
        color: appThemeData.colorScheme.onPrimary,
      );
  static get bodyMediumOnPrimaryContainer =>
      appThemeData.textTheme.bodyMedium!.copyWith(
        color: appThemeData.colorScheme.onPrimaryContainer,
      );
  static get bodySmallBluegray700 => appThemeData.textTheme.bodySmall!.copyWith(
        color: appThemeColors.blueGray700,
        fontSize: 10.fSize,
      );
  static get bodySmallBluegray800 => appThemeData.textTheme.bodySmall!.copyWith(
        color: appThemeColors.blueGray800,
      );
  static get bodySmallGilroyRegularErrorContainer =>
      appThemeData.textTheme.bodySmall!.gilroyRegular.copyWith(
        color: appThemeData.colorScheme.errorContainer,
      );
  static get bodySmallGilroySemiBoldBluegray50 =>
      appThemeData.textTheme.bodySmall!.gilroySemiBold.copyWith(
        color: appThemeColors.blueGray50,
      );
  static get bodySmallTeal800 => appThemeData.textTheme.bodySmall!.copyWith(
        color: appThemeColors.teal800,
      );
  static get bodySmallTeal80010 => appThemeData.textTheme.bodySmall!.copyWith(
        color: appThemeColors.teal800,
        fontSize: 10.fSize,
      );
  static get bodyMediumGilroySemiBoldOnPrimary =>
      appThemeData.textTheme.bodyMedium!.gilroySemiBold.copyWith(
        color: appThemeData.colorScheme.onPrimary,
      );

  static get headlineStyle1 => appThemeData.textTheme.displayLarge?.copyWith(
        color: appThemeColors.blueGray700,
      );
  static get headlineStyle2 => appThemeData.textTheme.displayMedium?.copyWith(
        color: appThemeColors.blueGray700,
      );

  static get headlineStyle3 => appThemeData.textTheme.displaySmall?.copyWith(
        color: appThemeColors.blueGray700,
      );
  static get headlineStyle4 => appThemeData.textTheme.displaySmall
      ?.copyWith(color: appThemeColors.blueGray700, fontSize: 10.fSize);

  static get pinCodeTextStyle => appThemeData.textTheme.displaySmall
      ?.copyWith(color: appThemeColors.blueGray700, fontSize: 20.fSize);

  static get formFieldTextStyle => appThemeData.textTheme.displaySmall
      ?.copyWith(color: appThemeColors.blueGray700, fontSize: 20.fSize);

  static get formFieldHintTextStyle => appThemeData.textTheme.displaySmall
      ?.copyWith(color: appThemeColors.blueGray700, fontSize: 20.fSize);

  static get buttonTextStyle => appThemeData.textTheme.displaySmall
      ?.copyWith(color: appThemeColors.blueGray700, fontSize: 20.fSize);

  static get textButtonTextStyle => appThemeData.textTheme.displaySmall
      ?.copyWith(color: appThemeColors.blueGray800, fontSize: 20.fSize);

  static get snackBarTextStyle => appThemeData.textTheme.displaySmall?.copyWith(
      color: appThemeColors.whiteA700,
      fontSize: 12.fSize,
      fontWeight: FontWeight.w100);

  static get belowButtonTextStyle => appThemeData.textTheme.bodySmall?.copyWith(
        color: appThemeColors.whiteA700,
        fontSize: 13.fSize,
        fontWeight: FontWeight.w500,
      );

  static textBelowBtnTextStyle(Color? color) {
    return appThemeData.textTheme.bodySmall?.copyWith(
      color: color,
      fontSize: 13.fSize,
      fontWeight: FontWeight.w500,
    );
  }
}

extension on TextStyle {
  TextStyle get gilroyExtraBold {
    return copyWith(
      fontFamily: 'Gilroy-ExtraBold',
    );
  }

  TextStyle get gilroyBold {
    return copyWith(
      fontFamily: 'Gilroy-Bold',
    );
  }

  TextStyle get gilroyRegular {
    return copyWith(
      fontFamily: 'Gilroy-Regular',
    );
  }

  TextStyle get gilroyMedium {
    return copyWith(
      fontFamily: 'Gilroy-Medium',
    );
  }

  TextStyle get gilroySemiBold {
    return copyWith(
      fontFamily: 'Gilroy-SemiBold',
    );
  }
}
