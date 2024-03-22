import 'package:trenda/core/app_export.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  ResetPasswordScreenState createState() => ResetPasswordScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthenticationProvider(),
      child: const ResetPasswordScreen(),
    );
  }
}

class ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
        appbarTitle: "lbl_forgot_password".tr,
        formKey: _formKey,
        children: [
          Text(
            'lbl_enter_code_to_reset_password'.tr,
            softWrap: true,
            maxLines: 3,
            textAlign: TextAlign.start,
            style: CustomTextStyles.headerTextStyle,
          ),
          buildWidgetSpace(height: 30.v),
          buildTextField(context, 'Enter code', label: "Enter code"),
          buildWidgetSpace(),
          buildPassword(context, string: 'msg_enter_new_password'.tr),
          buildWidgetSpace(),
          buildConfirmPassword(context, string: 'Confirm password'),
          buildWidgetSpace(height: 20.v),
          _buildResetPassword(context)
        ],
      ),
    );
  }

  Widget _buildResetPassword(BuildContext context) {
    return CustomOutlinedButton(
      text: "Reset password".tr,
      onPressed: () {
        buildNavTo(AppRoutes.signInScreen);
      },
    );
  }
}
