import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';

// ignore: must_be_immutable
class AppbarTitleImage extends StatelessWidget {
  AppbarTitleImage({
    super.key,
    this.imagePath,
    this.margin,
    this.onTap,
  });

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          imagePath: imagePath,
          height: 50.adaptSize,
          width: 50.adaptSize,
          fit: BoxFit.contain,
          color: appThemeColors.greenA700,
        ),
      ),
    );
  }
}
