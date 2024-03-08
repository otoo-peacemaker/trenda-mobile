import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';

import 'models/auth/request_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  SignUpScreenState createState() => SignUpScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AuthenticationProvider(),
        child: const SignUpScreen());
  }
}

// ignore_for_file: must_be_immutable
class SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: buildScaffold(
        context: context,
        appbarTitle: "lbl_sign_up",
        formKey: _formKey,
        children: [
          buildIconWidget('assets/images/img_trenda_logo_up_1.png',
              size: 72.fSize, color: appThemeColors.greenA700),
          buildWidgetSpace(height: 60.h),
          buildTextField(context, "lbl_enter_name"),
          buildWidgetSpace(),
          buildEmail(context),
          buildWidgetSpace(),
          buildPhoneNumber(context),
          buildWidgetSpace(),
          buildPassword(context),
          buildWidgetSpace(),
          buildConfirmPassword(context, string: "Confirm Password"),
          buildWidgetSpace(),
          buildTermsAndCondition(context),
          buildWidgetSpace(height: 30.h),
          _buildSignUp(context),
          buildWidgetSpace(),
          buildSignInWithGoogle(context),
          buildWidgetSpace(height: 100.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildWidgetSpace(height: 10.h),
              Text(
                'Already have an account?',
                style: CustomTextStyles.footerTextStyle,
              ),
              TextButton(
                style: CustomButtonStyles.textButtonStyle,
                onPressed: () {
                  NavigatorService.pushNamed(AppRoutes.signInScreen);
                },
                child: const Text(
                  'Sign In',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSignUp(BuildContext context) {
    return Material(
      child: Consumer<AuthenticationProvider>(
        builder: (context, provider, child) {
          return CustomOutlinedButton(
            text: "lbl_sign_up".tr,
            onPressed: () async {
              final name = provider.userNameController.text;
              final email = provider.emailController.text;
              final password = provider.passwordController.text;
              final confirmPassword = provider.confirmPasswordController.text;
              final mobile = provider.phoneNumberController.text;

              // Create the AuthenticationRequestBody
              AuthenticationRequestBody registerUser =
                  AuthenticationRequestBody(
                name: name,
                email: email,
                mobile: mobile,
                password: password,
              );
              if (_validateFields(password, confirmPassword, email, mobile,
                  provider.acceptTerms)) {
                provider
                    .authenticateUser(
                        endpoints: login, authRequestBody: registerUser)
                    .then((value) {
                  if (value?.success == true) {
                    showLoadingAndNavigate(
                        context, AppRoutes.verificyAccountScreen);
                  } else {
                    debugPrint("INSIDE Sign up::: ${value?.success}");
                    showCustomSnackBar(context, value!.error!, onRetry: () {});
                  }
                });
              }
            },
          );
        },
      ),
    );
  }

  bool _validateFields(String password, String confirmPassword, String email,
      String mobile, bool acceptTerms) {
    if (password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        email.isNotEmpty &&
        mobile.isNotEmpty) {
      if (acceptTerms) {
        return true;
      } else {
        showCustomSnackBar(
            context, 'Please accept our Terms and Privacy Policy',
            changeBgColor: false);
        return false;
      }
    } else if (password != confirmPassword) {
      showCustomSnackBar(context, 'Password do not match',
          changeBgColor: false);
      return false;
    } else {
      showCustomSnackBar(context, 'field(s) can not be empty',
          changeBgColor: false);
      return false;
    }
  }
}

/**
 *
 * CustomOutlinedButton(
    text: "lbl_sign_up".tr,
    onPressed: () async {
    final name = provider.userNameController.text;
    final email = provider.emailController.text;
    final password = provider.passwordController.text;
    final confirmPassword = provider.confirmPasswordController.text;
    final mobile = provider.phoneNumberController.text;

    AuthenticationRequestBody registerUser =
    AuthenticationRequestBody(
    name: name,
    email: email,
    mobile: mobile,
    password: password);
    if (password.isNotEmpty &&
    confirmPassword.isNotEmpty &&
    email.isNotEmpty &&
    mobile.isNotEmpty) {
    if (provider.acceptTerms) {
    provider
    .authenticateUser(
    endpoints: login, authRequestBody: registerUser)
    .then((value) {
    if (value?.success == true) {
    showLoadingAndNavigate(
    context, AppRoutes.verificyAccountScreen);
    } else {
    debugPrint("INSIDE Sign up::: ${value?.success}");
    showCustomSnackBar(context, value!.error!,
    onRetry: () {});
    }
    });
    } else {
    showCustomSnackBar(
    context, 'Please accept our Terms and  Privacy Policy',
    changeBgColor: false);
    }
    } else if (password != confirmPassword) {
    showCustomSnackBar(context, 'Password do not match',
    changeBgColor: false);
    } else {
    showCustomSnackBar(context, 'Please fill all field(s)',
    changeBgColor: false);
    }
    },
    );
 *
 * */

/**
 *  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
    return const YourModalSheet(
    message: 'Your Message',
    icon: Icons.info,
    backgroundColor: Colors.blue,
    );
    },
    );
 * */

class YourModalSheet extends StatelessWidget {
  final String message;
  final IconData icon;
  final Color backgroundColor;

  const YourModalSheet({
    super.key,
    required this.message,
    required this.icon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328.v,
      height: 36.h,
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 12.fSize,
              color: Colors.white,
            ),
            const SizedBox(height: 16.0),
            Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
