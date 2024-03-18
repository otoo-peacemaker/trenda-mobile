import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:trenda/core/app_export.dart';
import 'package:trenda/core/utils/validation_functions.dart';
import 'package:url_launcher/url_launcher.dart';

/// Section Widget
Widget buildEmail(BuildContext context) {
  final errorController = TextEditingController();
  return Selector<AuthenticationProvider, TextEditingController?>(
    selector: (context, provider) => provider.emailController,
    builder: (context, emailController, child) {
      return CustomTextFormField(
        labelText: 'Email',
        controller: emailController,
        hintText: "msg_enter_email_address".tr,
        textInputType: TextInputType.emailAddress,
        showPasswordToggle: false,
        validator: (value) {
          if (value == null || (!isValidEmail(value, isRequired: true))) {
            errorController.text = "err_msg_please_enter_valid_email".tr;
            debugPrint(value);
            return "err_msg_please_enter_valid_email".tr;
          }
          return null;
        },
      );
    },
  );
}

/// Section Widget
Widget buildPassword(BuildContext context,
    {String? string = 'Enter Password'}) {
  bool obscureText = true;
  return Selector<AuthenticationProvider, TextEditingController?>(
    selector: (context, provider) => provider.passwordController,
    builder: (context, passwordController, child) {
      return CustomTextFormField(
          labelText: 'Password',
          controller: passwordController,
          hintText: string,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          validator: (value) {
            obscureText = !obscureText;
            if (value == null || (!isValidPassword(value, isRequired: true))) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
          obscureText: obscureText);
    },
  );
}

/// Section Widget
Widget buildConfirmPassword(BuildContext context,
    {String? string = 'Enter Password'}) {
  bool obscureText = true;
  return Selector<AuthenticationProvider, TextEditingController?>(
    selector: (context, provider) => provider.confirmPasswordController,
    builder: (context, passwordController, child) {
      return CustomTextFormField(
          labelText: 'Confirm password',
          controller: passwordController,
          hintText: string,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          validator: (value) {
            obscureText = !obscureText;
            if (value == null || (!isValidPassword(value, isRequired: true))) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
          obscureText: obscureText);
    },
  );
}

Widget buildPhoneNumber(BuildContext context) {
  return Consumer<AuthenticationProvider>(builder: (context, provider, child) {
    return CustomPhoneNumber(
        country: provider.selectedCountry ??
            CountryPickerUtils.getCountryByIsoCode('GH'),
        controller: provider.phoneNumberController,
        onTap: (Country value) {
          context.read<AuthenticationProvider>().changeCountry(value);
        });
  });
}

/// Section Widget
Widget buildTextField(BuildContext context, String text) {
  return Selector<AuthenticationProvider, TextEditingController?>(
    selector: (context, provider) => provider.userNameController,
    builder: (context, passwordController, child) {
      return CustomTextFormField(
        labelText: 'Business or username',
        controller: passwordController,
        hintText: text.tr,
        textInputAction: TextInputAction.next,
        textInputType: TextInputType.text,
        showPasswordToggle: false,
        validator: (value) {
          if (value == null || (!isText(value, isRequired: true))) {
            return "err_msg_please_enter_valid_name".tr;
          }
          return null;
        },
      );
    },
  );
}

/// Section Widget
Widget buildRememberMeWithForgotPassword(
    BuildContext context, Function()? onPressed) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Padding(
      padding: EdgeInsets.only(bottom: 1.v),
      child: Selector<AuthenticationProvider, bool?>(
        selector: (context, provider) => provider.rememberMe,
        builder: (context, rememberMe, child) {
          return CustomCheckboxButton(
            text: "lbl_remember_me".tr,
            value: rememberMe,
            onChange: (value) {
              context.read<AuthenticationProvider>().changeCheckBox1(value);
            },
            textStyle: CustomTextStyles.noticeTextStyle,
          );
        },
      ),
    ),
    TextButton(
      onPressed: onPressed,
      style: CustomButtonStyles.textButtonStyle,
      child: Text(
        "lbl_forgot_password".tr,
        //style: CustomTextStyles.textBelowBtnTextStyle(color),
      ),
    )
  ]);
}

/// Section Widget
Widget buildTermsAndCondition(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(bottom: 1.v),
    child: Selector<AuthenticationProvider, bool?>(
      selector: (context, provider) => provider.acceptTerms,
      builder: (context, terms, child) {
        return TermsAndPrivacyCheckbox(
          isChecked: terms!,
          onChange: (value) {
// Listen to changes in the checkbox value
            debugPrint('Checkbox value changed: $value');
            context.read<AuthenticationProvider>().changeCheckBox2(value);
          },
        );
      },
    ),
  );
}

void buildNavTo(String string) {
  NavigatorService.pushNamed(string);
}

SizedBox buildWidgetSpace({
  double? width = 0,
  double? height = 10,
}) =>
    SizedBox(
      height: height?.v,
      width: width?.h,
    );

Widget buildIconWidget(String imagePath, {double size = 24, Color? color}) {
  return Image.asset(
    imagePath,
    width: size,
    height: size,
    color: color,
  );
}

Widget buildIconData(String imagePath,
    {double size = 24, Color? color, required Function onPressed}) {
  return IconButton(
    icon: Image.asset(
      imagePath,
      width: size,
      height: size,
      color: color,
    ),
    onPressed: onPressed(),
  );
}

void showLoadingAndNavigate(BuildContext context, String screen) {
  // Show Easy Loading
  CustomEasyLoading.showLoading();
  // Delay for 5 seconds
  Future.delayed(const Duration(seconds: 2), () {
    // Hide Easy Loading
    CustomEasyLoading.dismiss();
    // Navigate to the next screen
    //buildNavTo(AppRoutes.homepagePage);
    NavigatorService.pushNamed(screen);
  });
}

void showCustomSnackBar(BuildContext context, String message,
    {bool changeBgColor = true, VoidCallback? onRetry}) {
  final snackBarHeight = MediaQuery.of(context).size.height *
      0.08; // Adjust the fraction as needed

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor:
          changeBgColor ? appThemeColors.greenA700 : const Color(0xFFF97066),
      content: Text(
        message,
        textAlign: TextAlign.start,
        style: CustomTextStyles.snackBarTextStyle,
      ),
      duration: const Duration(seconds: 2), // Adjust the duration as needed
      action: onRetry != null
          ? SnackBarAction(
              label: 'Retry',
              onPressed: onRetry,
              textColor: appThemeColors.blueGray800,
            )
          : null,
    ),
  );
}

class TermsAndPrivacyCheckbox extends StatefulWidget {
  final ValueChanged<bool>? onChange;
  bool isChecked = false;

  TermsAndPrivacyCheckbox({super.key, this.onChange, required this.isChecked});

  @override
  _TermsAndPrivacyCheckboxState createState() =>
      _TermsAndPrivacyCheckboxState();
}

class _TermsAndPrivacyCheckboxState extends State<TermsAndPrivacyCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: widget.isChecked,
          onChanged: (value) {
            setState(() {
              widget.isChecked = value!;
              widget.onChange?.call(value);
            });
          },
        ),
        Text(
          ' I agree with the ',
          style: CustomTextStyles.noticeTextStyle,
        ),
        GestureDetector(
          onTap: () {
            _launchURL('https://www.trenda.live/');
          },
          child: Text(
            'Terms ',
            style: CustomTextStyles.noticeLinkTextStyle,
          ),
        ),
        Text('and ', style: CustomTextStyles.noticeTextStyle),
        GestureDetector(
          onTap: () {
            _launchURL('https://www.trenda.live/privacy');
          },
          child: Text('Privacy Policy',
              style: CustomTextStyles.noticeLinkTextStyle),
        ),
      ],
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
