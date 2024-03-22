import 'package:trenda/core/app_export.dart';

class VerifyAccountScreen extends StatefulWidget {
  const VerifyAccountScreen({super.key});

  @override
  VerifyAccountScreenState createState() => VerifyAccountScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthenticationProvider(),
      child: const VerifyAccountScreen(),
    );
  }
}

class VerifyAccountScreenState extends State<VerifyAccountScreen> {
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
        appbarTitle: "Verify Account",
        formKey: _formKey,
        children: [
          Text('Enter the verification Code',
              textAlign: TextAlign.start,
              maxLines: 2,
              style: CustomTextStyles.headerTextStyle),
          buildWidgetSpace(height: 30.v),
          CustomPinCodeTextField(
            context: context,
            onChanged: (value) {},
          ),
          buildWidgetSpace(height: 20.v),
          _buildVerifyCode(context),
          buildWidgetSpace(height: 20.v),
          Text(
            textAlign: TextAlign.center,
            softWrap: true,
            maxLines: 2,
            'You have not received any code?\n request for a new code',
            style: CustomTextStyles.noticeTextStyle,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "\n Resend Code".tr,
              style: CustomTextStyles.bodyMediumGilroyRegularGreenA700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerifyCode(BuildContext context) {
    return CustomOutlinedButton(
      text: "lbl_verify".tr,
      onPressed: () {
        buildNavTo(AppRoutes.signInScreen);
      },
    );
  }
}
