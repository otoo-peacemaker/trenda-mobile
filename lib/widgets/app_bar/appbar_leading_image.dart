import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';

// ignore: must_be_immutable
class AppbarLeadingImage extends StatelessWidget {
  AppbarLeadingImage({
    super.key,
    this.imagePath,
    this.margin,
    this.onTap,
    this.color,
  });

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          imagePath: imagePath,
          height: 20.adaptSize,
          width: 20.adaptSize,
          fit: BoxFit.contain,
          color: color ?? const Color(0xFF101828),
        ),
      ),
    );
  }
}
