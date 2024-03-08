import 'package:flutter/material.dart';
import 'package:trenda/components/build_widget_components.dart';
import '../core/app_export.dart';
import 'base_button.dart';

class CustomTextButton extends BaseButton {
  const CustomTextButton({
    super.key,
    this.leftIcon,
    this.rightIcon,
    super.isDisabled,
    super.height,
    super.width,
    super.margin,
    required super.text,
    this.textColor,
    super.buttonStyle,
    required this.style,
    super.alignment = Alignment
        .centerLeft, // Add alignment parameter with default value// Add buttonStyle parameter
  });

  final Widget? leftIcon;
  final Widget? rightIcon;
  final Color? textColor;
  final dynamic style; // Adjusted to match the constructor

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: super.alignment!,
      child: buildTextButtonWidget(),
    );
  }

  Widget buildTextButtonWidget() {
    return ElevatedButton.icon(
      onPressed: isDisabled ?? false ? null : onPressed,
      icon: leftIcon ??
          const SizedBox(), // Use leftIcon or SizedBox() if leftIcon is null
      label: Text(
        text,
        textAlign: TextAlign.left,
        style: CustomTextStyles.noticeTextStyle
            .copyWith(color: textColor, fontSize: 10.fSize),
      ),
      style: buttonStyle ??
          ElevatedButton.styleFrom(
            padding: EdgeInsets.all(5.adaptSize),
            side: const BorderSide(
              color: Colors.grey,
            ),
            disabledBackgroundColor: Colors
                .transparent, // Set default background color to transparent
          ),
    );
  }
}
