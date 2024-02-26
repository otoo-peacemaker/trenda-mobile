import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';

import '../../data/models/auth/request_model.dart';

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
              size: 72.fSize, color: theme.colorScheme.onSurface),
          buildWidgetSpace(height: 60.h),
          buildTextField(context, "lbl_enter_name"),
          buildWidgetSpace(),
          buildEmail(context),
          buildWidgetSpace(),
          buildPhoneNumber(context),
          buildWidgetSpace(),
          buildPassword(context),
          buildWidgetSpace(),
          buildPassword(context, string: "Confirm Password"),
          buildWidgetSpace(),
          buildTermsAndCondition(context, () {
            //print('Forgot password');
          }),
          buildWidgetSpace(height: 30.h),
          _buildSignUp(context),
          buildWidgetSpace(),
          buildSignInWithGoogle(context),
          buildWidgetSpace(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: CustomTextStyles.headlineStyle3,
              ),
              buildWidgetSpace(height: 100.h),
              TextButton(
                style: OutlinedButton.styleFrom(
                  textStyle: theme.textTheme.bodyMedium,
                  foregroundColor: theme.colorScheme.onSurface,
                ),
                onPressed: () {
                  NavigatorService.pushNamed(AppRoutes.signInScreen);
                },
                child: const Text('Sign In'),
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
              // final email = provider.emailController.text;
              // final password = provider.passwordController.text;

              AuthenticationRequestBody registerUser =
                  AuthenticationRequestBody(
                      name: provider.userNameController.text,
                      email: provider.emailController.text,
                      mobile: provider.phoneNumberController.text,
                      password: provider.passwordController.text);
              if (provider.rememberMe) {
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
              } else {
                showCustomSnackBar(
                    context, 'Please accept our Terms and  Privacy Policy');
              }
            },
          );
        },
      ),
    );
  }
}
