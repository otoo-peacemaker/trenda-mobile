import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import 'package:trenda/data/models/auth/response_model.dart';
import 'package:trenda/data/repository/authentication_repository.dart';
import 'package:trenda/presentation/homepage_page/homepage_page.dart';

import '../../data/models/auth/request_model.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AuthenticationProvider(),
        child: const SignInScreen());
  }
}

// ignore_for_file: must_be_immutable
class _SignInScreenState extends State<SignInScreen> {
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
        appbarTitle: "lbl_sign_in",
        formKey: _formKey,
        children: [
          buildIconWidget('assets/images/img_trenda_logo_up_1.png',
              size: 74.fSize, color: theme.colorScheme.onSurface),
          buildWidgetSpace(height: 40.h),
          Form(
            child: Column(
              children: [
                buildEmail(context),
                buildWidgetSpace(),
                buildPassword(context),
              ],
            ),
          ),
          buildWidgetSpace(),
          buildRememberMeWithForgotPassword(context, () {
            buildNavTo(AppRoutes.forgotPasswordScreen);
          }),
          buildWidgetSpace(),
          _buildSignIn(context),
          buildWidgetSpace(),
          buildSignInWithGoogle(context),
          buildWidgetSpace(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'msg_don_t_have_an_account'.tr,
                style: CustomTextStyles.headlineStyle3,
              ),
              buildWidgetSpace(height: 100.h),
              TextButton(
                style: OutlinedButton.styleFrom(
                    textStyle: theme.textTheme.bodyMedium,
                    foregroundColor: theme.colorScheme.onSurface),
                onPressed: () {
                  buildNavTo(AppRoutes.signUpScreen);
                },
                child: const Text('Sign Up'),
              ),
            ],
          )
        ],
      ),
    );
  }

  void buildNavTo(String string) {
    NavigatorService.pushNamed(string);
  }

  /// Section Widget
  Widget _buildSignIn(BuildContext context) {
    return Material(
      child: Consumer<AuthenticationProvider>(
        builder: (context, provider, child) {
          return CustomOutlinedButton(
            text: "lbl_sign_in".tr,
            onPressed: () async {
              final email = provider.emailController.text;
              final password = provider.passwordController.text;
              AuthenticationRequestBody loginUser = AuthenticationRequestBody(
                email: email,
                password: password,
              );
              provider
                  .authenticateUser(
                      endpoints: login, authRequestBody: loginUser)
                  .then((value) {
                if (value != null) {
                  if (value.success == true) {
                    PrefUtils.saveAccessToken(value.token!);
                    NavigatorService.pushNamed(AppRoutes.homepagePage);
                  } else {
                    debugPrint("INSIDE LOGIN::: ${value.success}");
                    debugPrint("INSIDE Sign up::: ${value.success}");
                    showCustomSnackBar(context, value.error!, onRetry: () {});
                  }
                } else {
                  showCustomSnackBar(context, provider.message);
                }
              });
            },
          );
        },
      ),
    );
  }
}