import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import 'package:trenda/widgets/app_bar/custom_app_bar.dart';
import 'package:trenda/widgets/custom_checkbox_button.dart';
import 'package:trenda/widgets/custom_outlined_button.dart';
import 'package:trenda/widgets/custom_text_form_field.dart';
import 'package:trenda/domain/facebookauth/facebook_auth_helper.dart';

Widget _buildSignInWithFacebook(BuildContext context) {
  return CustomOutlinedButton(
    text: "msg_sign_in_with_facebook".tr,
    leftIcon: Container(
      margin: EdgeInsets.only(right: 12.h),
      child: CustomImageView(
          imagePath: ImageConstant.imgSocialIcon,
          height: 24.adaptSize,
          width: 24.adaptSize),
    ),
    buttonStyle: CustomButtonStyles.outlineOnErrorContainerTL8,
    buttonTextStyle: CustomTextStyles.bodyMediumErrorContainer,
    onPressed: () {
      onTapSignInWithFacebook(context);
    },
  );
}

onTapSignInWithFacebook(BuildContext context) async {
  await FacebookAuthHelper().facebookSignInProcess().then(
    (facebookUser) {
      //TODO Actions to be performed after signin
    },
  ).catchError(
    (onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    },
  );
}
