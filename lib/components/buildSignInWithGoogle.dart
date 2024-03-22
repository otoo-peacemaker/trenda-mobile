import 'package:trenda/core/app_export.dart';

Widget buildSignInWithGoogle(BuildContext context) {
  return CustomOutlinedButton(
    leftIcon: buildIconWidget('assets/images/google_ico.png'),
    text: "lbl_sign_in_with_Google".tr,
    buttonStyle: OutlinedButton.styleFrom(
      side: const BorderSide(
        color: Colors.grey,
      ),
      backgroundColor: Colors.transparent,
      textStyle: appThemeData.textTheme.bodySmall?.copyWith(
        fontSize: 16.fSize,
        color: appThemeColors.blueGray900,
      ),
    ),
    onPressed: () {
      debugPrint('login press');
    },
  );
}
