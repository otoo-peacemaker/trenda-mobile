import 'package:flutter/material.dart';
import 'package:trenda/presentation/authentication/forgot_password.dart';
import 'package:trenda/presentation/authentication/select_option_to_verify_account_screen.dart';
import 'package:trenda/presentation/authentication/sign_up_screen.dart';
import 'package:trenda/presentation/authentication/sign_in_screen.dart';
import 'package:trenda/presentation/authentication/verificy_account_screen.dart';
import 'package:trenda/presentation/request_new_code_screen/request_new_code_screen.dart';
import 'package:trenda/presentation/authentication/reset_password_screen.dart';
import 'package:trenda/presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/homepage/screens/all_categories/explore_product_categories.dart';
import '../presentation/homepage/screens/product_details/product_details_page.dart';
import '../presentation/homepage/screens/product_details/product_profile_details.dart';
import '../presentation/homepage/widgets/container/mainpage_container.dart';
import '../presentation/onboarding/onboarding_frame_screen.dart';
import '../presentation/sell_or_buy_screen/sell_or_buy_screen.dart';
import '../presentation/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String onboardingOneScreen = '/onboarding_one_screen';
  static const String splashScreen = '/splash_screen';
  static const String sellOrBuyScreen = '/sell_or_buy_screen';
  static const String initialRoute = '/initialRoute';

  static const String selectOptionToVerifyAccountScreen =
      '/select_option_to_verify_account_screen';

  static const String onboardingTwoScreen = '/onboarding_two_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String signInScreen = '/sign_in_screen';

  static const String verificyAccountScreen = '/verificy_account_screen';

  static const String requestNewCodeScreen = '/request_new_code_screen';

  static const String resetPasswordScreen = '/reset_password_screen';

  static const String homepageContainer = '/homepage_page';

  static const String homepageTabContainerScreen =
      '/homepage_tab_container_screen';
  static const String homepage = '/homepage_latest_tab_container_page';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String forgotPasswordScreen = '/forgot_password';
  static const String exploreCategory = '/explore_product_categories';
  static const String productDetailsPage = '/product_details_page';
  static const String productProfileDetailsPage = '/product_profile_details';

  static Map<String, WidgetBuilder> get routes => {
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: SplashScreen.builder,
        onboardingOneScreen: ManuallyControlledSlider.builder,
        sellOrBuyScreen: SellOrBuyScreen.builder,
        signUpScreen: SignUpScreen.builder,
        signInScreen: SignInScreen.builder,
        verificyAccountScreen: VerifyAccountScreen.builder,
        selectOptionToVerifyAccountScreen:
            SelectOptionToVerifyAccountScreen.builder,
        requestNewCodeScreen: RequestNewCodeScreen.builder,
        resetPasswordScreen: ResetPasswordScreen.builder,
        forgotPasswordScreen: ForgotPasswordScreen.builder,
        homepageContainer: HomepagePageContainer.builder,
        exploreCategory: ExploreProductCategory.builder,
        productDetailsPage: ProductDetailsPage.builder,
        productProfileDetailsPage: ProductProfileDetailsPage.builder,

        // splashScreen: SplashScreen.builder,
      };
}
