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
    ),
    onPressed: () {
      debugPrint('login press');
    },
  );
}
