import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import 'package:trenda/widgets/app_bar/custom_app_bar.dart';
import 'package:trenda/widgets/app_bar/appbar_leading_image.dart';
import 'package:trenda/widgets/app_bar/appbar_title.dart';

Scaffold buildScaffold({
  required BuildContext context,
  required String appbarTitle,
  required GlobalKey<FormState> formKey,
  required List<Widget> children,
}) {
  double screenHeight = MediaQuery.of(context).size.height;

  return Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: _buildAppBar(context, appbarTitle),
    body: Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: screenHeight * 0.05, // Adjust this factor as needed
        ),
        child: Form(
          key: formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
                horizontal: 16, vertical: screenHeight * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          ),
        ),
      ),
    ),
  );
}

PreferredSizeWidget _buildAppBar(BuildContext context, String appbarTitle) {
  return AppBar(
    title: AppbarTitle(
      text: appbarTitle.tr,
    ),
    centerTitle: true,
    leadingWidth: 33.h,
    iconTheme: IconThemeData(color: appTheme.blueGray700),
  );
}
/*
* CustomAppBar(
    leadingWidth: 33.h,
    leading: AppbarLeadingImage(
      imagePath: ImageConstant.imgLeftarrowIcon,
      margin: EdgeInsets.only(
        left: 13.h,
        top: 28.v,
        bottom: 12.v,
      ),
    ),
    centerTitle: true,
    title: AppbarTitle(
      text: appbarTitle.tr,
    ),
    styleType: Style.bgFill,
  );
*
* */
