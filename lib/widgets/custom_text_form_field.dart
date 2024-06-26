import '../core/app_export.dart';
import '../theme/styles/custom_textfield_style.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.showPasswordToggle = true,
    this.labelText,
    this.enableLabel = true,
  });

  final Alignment? alignment;
  final double? width;
  final TextEditingController? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? textStyle;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool? filled;
  final bool enableLabel;
  final FormFieldValidator<String>? validator;
  final bool showPasswordToggle;

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;
  late FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  Widget build(BuildContext context) {
    return widget.alignment != null
        ? Align(
            alignment: widget.alignment!,
            child: _textFormFieldWidget(context),
          )
        : _textFormFieldWidget(context);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      // Update the obscureText state based on focus
      _obscureText = widget.obscureText! && !_focusNode.hasFocus;
    });
  }

  Widget _textFormFieldWidget(BuildContext context) => SizedBox(
        width: widget.width ?? double.maxFinite,
        child: TextFormField(
          scrollPadding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          controller: widget.controller,
          focusNode: widget.focusNode ?? _focusNode,
          autofocus: widget.autofocus!,
          style: widget.textStyle ?? CustomTextFieldStyle.inputTextStyle,
          obscureText: _obscureText,
          textInputAction: widget.textInputAction!,
          keyboardType: widget.textInputType!,
          maxLines: widget.maxLines ?? 1,
          decoration: _decoration,
          validator: widget.validator,
          cursorColor: appThemeData.colorScheme.primary,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      );

  InputDecoration get _decoration => InputDecoration(
        label: widget.enableLabel ? Text('${widget.labelText}') : null,
        labelStyle: CustomTextFieldStyle.labelStyle,
        helperStyle: CustomTextFieldStyle.helperStyle,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ?? CustomTextFieldStyle.hintStyle,
        errorStyle: CustomTextFieldStyle.errorStyle,
        prefixIcon: widget.prefix,
        prefixIconConstraints: widget.prefixConstraints,
        suffixIcon: widget.showPasswordToggle ? _suffixIcon : null,
        suffixIconConstraints: widget.suffixConstraints,
        isDense: true,
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 12.h,
              vertical: 16.v,
            ),
        fillColor: widget.fillColor ?? appThemeColors.whiteA70001,
        filled: widget.filled,
        border: widget.borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.h),
              borderSide: BorderSide(
                color: appThemeData.colorScheme.onErrorContainer,
                width: 1,
              ),
            ),
        enabledBorder: widget.borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.h),
              borderSide: BorderSide(
                color: appThemeData.colorScheme.onErrorContainer,
                width: 1,
              ),
            ),
        focusedBorder: widget.borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.h),
              borderSide: BorderSide(
                color: appThemeData.colorScheme.onErrorContainer,
                width: 1,
              ),
            ),
        errorText: null,
        floatingLabelBehavior: widget.labelText != null
            ? FloatingLabelBehavior.auto
            : FloatingLabelBehavior
                .auto, // Set floatingLabelBehavior// Initially no error text
      );

  Widget get _suffixIcon => IconButton(
        iconSize: 24.adaptSize,
        icon: Image.asset(
          height: 20.h,
          width: 20.v,
          _obscureText
              ? 'assets/icons/visibility_off.png'
              : 'assets/icons/visibility_on.png',
          color: appThemeColors.blueGray800,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      );
}

/// Extension on [CustomTextFormField] to facilitate inclusion of all types of border style etc
extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get fillCyan => OutlineInputBorder(
        borderRadius: BorderRadius.circular(2.h),
        borderSide: BorderSide.none,
      );
  static OutlineInputBorder get outlineBlueGray => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.h),
        borderSide: BorderSide(
          color: appThemeColors.blueGray100,
          width: 1,
        ),
      );
  static OutlineInputBorder get outlineBlueGrayTL8 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.h),
        borderSide: BorderSide(
          color: appThemeColors.blueGray500,
          width: 1,
        ),
      );
  static OutlineInputBorder get outlineRed => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.h),
        borderSide: BorderSide(
          color: appThemeColors.red500,
          width: 1,
        ),
      );
  static OutlineInputBorder get outlineBlueGrayTL82 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.h),
        borderSide: BorderSide(
          color: appThemeColors.blueGray500,
          width: 1,
        ),
      );
  static OutlineInputBorder get outlineBlueGrayTL83 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.h),
        borderSide: BorderSide(
          color: appThemeColors.blueGray500,
          width: 1,
        ),
      );
  static OutlineInputBorder get outlineBlueGrayTL84 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.h),
        borderSide: BorderSide(
          color: appThemeColors.blueGray100,
          width: 1,
        ),
      );
}
