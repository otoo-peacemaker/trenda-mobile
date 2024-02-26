import 'package:flutter/material.dart';
import 'package:trenda/components/build_widget_components.dart';
import '../core/app_export.dart';
import 'base_button.dart';

class CustomTextButton extends BaseButton {
  CustomTextButton(
    this.children,
    this.label, {
    super.key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    super.onPressed,
    super.buttonStyle,
    super.buttonTextStyle,
    super.isDisabled,
    super.alignment,
    super.height,
    super.width,
    super.margin,
    required super.text,
    this.strokeColor,
    this.cornerRadius,
    required style,
  });

  final BoxDecoration? decoration;
  final Color? strokeColor;
  final double? cornerRadius;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final Widget label;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildTextButtonWidget(),
          )
        : buildTextButtonWidget();
  }

  Widget buildTextButtonWidget() {
    return Container(
      height: height ?? 44.v,
      width: width ?? double.maxFinite,
      margin: margin,
      decoration: decoration?.copyWith(
        border: Border.all(color: strokeColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(cornerRadius ?? 0),
      ),
      child: TextButton(
        style: buttonStyle,
        onPressed: isDisabled ?? false ? null : onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
