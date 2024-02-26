import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:trenda/core/app_export.dart';

enum Status { SUCCESS, ERROR, EXCEPTION, LOADING, NO_INTERNET, NONE }

class CustomEasyLoading {
  static void configure() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 30
      ..displayDuration = const Duration(seconds: 2)
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.white
      ..indicatorColor = appThemeColors.greenA700
      ..textColor = appThemeColors.blueGray500
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false
      ..maskType = EasyLoadingMaskType.black
      ..customAnimation = CustomAnimation();
  }

  static void showToast(String message) {
    EasyLoading.showToast(
      message,
      toastPosition: EasyLoadingToastPosition.bottom,
      maskType: EasyLoadingMaskType.black,
    );
  }

  static void showLoading({String status = 'loading..'}) {
    EasyLoading.show(status: status);
  }

  static void showInfo({required String status}) {
    EasyLoading.showInfo(status, dismissOnTap: true);
  }

  static void dismiss() {
    EasyLoading.dismiss();
  }
}

class CustomAnimation extends EasyLoadingAnimation {
  @override
  Widget buildWidget(
    Widget child,
    AnimationController controller,
    AlignmentGeometry alignment,
  ) {
    return const CircularProgressIndicator(
      backgroundColor: Colors.blue,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
    );
  }
}
