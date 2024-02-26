import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../core/app_export.dart';

class CustomPinCodeTextField extends StatelessWidget {
  CustomPinCodeTextField({
    super.key,
    required this.context,
    required this.onChanged,
    this.alignment,
    this.controller,
    this.textStyle,
    this.hintStyle,
    this.validator,
  });

  final Alignment? alignment;

  final BuildContext context;

  final TextEditingController? controller;

  final TextStyle? textStyle;

  final TextStyle? hintStyle;

  Function(String) onChanged;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: pinCodeTextFieldWidget,
          )
        : pinCodeTextFieldWidget;
  }

  Widget get pinCodeTextFieldWidget => PinCodeTextField(
        appContext: context,
        controller: controller,
        length: 4,
        keyboardType: TextInputType.number,
        textStyle: textStyle ?? CustomTextStyles.pinCodeTextStyle,
        hintStyle: hintStyle ?? theme.textTheme.displaySmall,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        enableActiveFill: true,
        cursorColor: appTheme.greenA200,
        pinTheme: PinTheme(
          fieldHeight: 64.h,
          fieldWidth: 64.h,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8.h),
          inactiveColor: theme.colorScheme.onErrorContainer,
          activeColor: theme.colorScheme.onErrorContainer,
          inactiveFillColor: appTheme.gray100,
          activeFillColor: appTheme.gray100,
          selectedColor: appTheme.greenA100,
          selectedFillColor: theme.colorScheme.primary,
        ),
        onChanged: (value) => onChanged(value),
        validator: validator,
      );
}
