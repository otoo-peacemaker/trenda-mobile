import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';

// ignore: must_be_immutable
class AppbarTitle extends StatelessWidget {
  AppbarTitle({
    super.key,
    required this.text,
    this.margin,
    this.onTap,
  });

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFF0F1728),
            fontSize: 18,
            fontFamily: 'Gilroy-Regular',
            fontWeight: FontWeight.w400,
            height: 0.09,
          ),
        ),
      ),
    );
  }
}
