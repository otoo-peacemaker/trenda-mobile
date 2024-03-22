import 'package:trenda/core/app_export.dart';

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
        appbarTitle: "lbl_forgot_password".tr,
        formKey: _formKey,
        children: [
          Text(
            'Request your password by entering your email below',
            softWrap: true,
            maxLines: 3,
            textAlign: TextAlign.start,
            style: CustomTextStyles.headerTextStyle,
          ),
          buildWidgetSpace(height: 30.v),
          buildEmail(context),
          buildWidgetSpace(height: 20.v),
          _buildSendRequestLink(context),
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
