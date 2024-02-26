import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';

class RequestNewScreen extends StatefulWidget {
  const RequestNewScreen({super.key});

  @override
  VerifyAccountScreenState createState() => VerifyAccountScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthenticationProvider(),
      child: const RequestNewScreen(),
    );
  }
}

class VerifyAccountScreenState extends State<RequestNewScreen> {
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
          Text(
            'Request New Code',
            textAlign: TextAlign.center,
            style: CustomTextStyles.headlineStyle3,
          ),
          buildWidgetSpace(height: 30.v),
          buildEmail(context),
          buildWidgetSpace(height: 20.v),
          _buildRequestCode(context)
        ],
      ),
    );
  }

  Widget _buildRequestCode(BuildContext context) {
    return CustomOutlinedButton(
      text: "Request New Code".tr,
      onPressed: () {
        buildNavTo(AppRoutes.resetPasswordScreen);
      },
    );
  }
}
