import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trenda/core/app_export.dart';

class SelectOptionToVerifyAccountScreen extends StatefulWidget {
  const SelectOptionToVerifyAccountScreen({super.key});

  @override
  SelectOptionToVerifyAccountScreenState createState() =>
      SelectOptionToVerifyAccountScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthenticationProvider(),
      child: const SelectOptionToVerifyAccountScreen(),
    );
  }
}

class SelectOptionToVerifyAccountScreenState
    extends State<SelectOptionToVerifyAccountScreen> {
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
            'Select the options below to receive your verification code',
            textAlign: TextAlign.center,
            style: CustomTextStyles.headerTextStyle,
          ),
          buildWidgetSpace(height: 30.v),
          buildWidgetSpace(height: 20.v),
          CustomOutlinedButton(
            text: '  +233245518918',
            leftIcon: SvgPicture.asset(
              ImageConstant.imgSmartphone,
              fit: BoxFit.contain,
            ),
            buttonStyle: OutlinedButton.styleFrom(
                backgroundColor: appThemeColors.gray50),
            buttonTextStyle: appThemeData.textTheme.bodySmall?.copyWith(
              color: appThemeColors.blueGray700,
            ),
            onPressed: () {
              buildNavTo(AppRoutes.verificyAccountScreen);
            },
          ),
          buildWidgetSpace(),
          CustomOutlinedButton(
            text: '  nanakwesiotoo@gmailc.com',
            leftIcon: SvgPicture.asset(
              ImageConstant.imgMail,
              fit: BoxFit.contain,
            ),
            buttonStyle: OutlinedButton.styleFrom(
                backgroundColor: appThemeColors.gray50),
            buttonTextStyle: appThemeData.textTheme.bodySmall?.copyWith(
              color: appThemeColors.blueGray700,
            ),
            onPressed: () {
              buildNavTo(AppRoutes.verificyAccountScreen);
            },
          ),
        ],
      ),
    );
  }
}
// buildIconWidget(ImageConstant.imgSmartphone, size: 5),
