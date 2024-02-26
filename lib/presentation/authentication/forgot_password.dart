import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import 'package:trenda/widgets/custom_outlined_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  SignInScreenState createState() => SignInScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AuthenticationProvider(),
        child: const ForgotPasswordScreen());
  }
}

// ignore_for_file: must_be_immutable
class SignInScreenState extends State<ForgotPasswordScreen> {
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
        appbarTitle: "lbl_forgot_password",
        formKey: _formKey,
        children: [
          Text(
            'Request your password by entering your email below',
            textAlign: TextAlign.center,
            style: CustomTextStyles.headlineStyle3,
          ),
          buildWidgetSpace(height: 30.v),
          buildEmail(context),
          buildWidgetSpace(height: 20.v),
          _buildSendRequestLink(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Return'.tr,
                style: theme.textTheme.bodyMedium,
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

  /// Section Widget
  Widget _buildSendRequestLink(BuildContext context) {
    return CustomOutlinedButton(
      text: "lbl_send_request_link".tr,
      onPressed: () {
        buildNavTo(AppRoutes.resetPasswordScreen);
      },
    );
  }
}
