import 'package:trenda/presentation/authentication/sign_in_screen.dart';
import 'models/onboarding_two_model.dart';
import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import 'provider/onboarding_two_provider.dart';

class OnboardingTwoScreen extends StatefulWidget {
  const OnboardingTwoScreen({super.key});

  @override
  OnboardingTwoScreenState createState() => OnboardingTwoScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => OnboardingTwoProvider(),
        child: const OnboardingTwoScreen());
  }
}

class OnboardingTwoScreenState extends State<OnboardingTwoScreen> {
  @override
  void initState() {
    super.initState();
    /*Future.delayed(const Duration(milliseconds: 3000), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.signInScreen,
      );
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 2.v),
              Text("msg_what_do_you_want".tr,
                  style: theme.textTheme.titleLarge),
              SizedBox(height: 34.v),
              CustomOutlinedButton(
                text: "lbl_sell".tr,
                buttonStyle: CustomButtonStyles.outlineGreenA,
                onPressed: () {
                  showLoadingAndNavigate(context, AppRoutes.signInScreen);
                },
              ),
              SizedBox(height: 16.v),
              CustomOutlinedButton(
                text: "lbl_buy".tr,
                buttonStyle: CustomButtonStyles.outlineGreenATL8,
                onPressed: () {
                  showLoadingAndNavigate(context, AppRoutes.signInScreen);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
