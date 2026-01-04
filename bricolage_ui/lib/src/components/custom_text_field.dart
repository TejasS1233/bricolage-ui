import 'package:flutter/material.dart';
import '../theme/theme.dart';

enum CustomTextFieldSize { small, medium, large }

/// A customizable text field component with accessibility support
class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? placeholder;
  final String? helperText;
  final String? errorText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final CustomTextFieldSize size;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? textColor;
  final Color? labelColor;
  final double? borderRadius;
  final EdgeInsets? contentPadding;
  final double? borderWidth;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  final ValueChanged<String>? onChanged;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool enabled;
  final String? semanticLabel;

  const CustomTextField({
    Key? key,
    this.controller,
    this.label,
    this.placeholder,
    this.helperText,
    this.errorText,
    this.keyboardType,
    this.obscureText = false,
    this.size = CustomTextFieldSize.medium,
    this.backgroundColor,
    this.borderColor,
    this.focusedBorderColor,
    this.textColor,
    this.labelColor,
    this.borderRadius,
    this.contentPadding,
    this.borderWidth,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconTap,
    this.onChanged,
    this.maxLines = 1,
    this.fontSize,
    this.fontWeight,
    this.enabled = true,
    this.semanticLabel,
  }) : super(key: key);

  EdgeInsets _getDefaultPadding() {
    switch (size) {
      case CustomTextFieldSize.small:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 8);
      case CustomTextFieldSize.medium:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
      case CustomTextFieldSize.large:
        return const EdgeInsets.symmetric(horizontal: 20, vertical: 16);
    }
  }

  double _getDefaultFontSize() {
    switch (size) {
      case CustomTextFieldSize.small:
        return UITypography.fontSizeSM;
      case CustomTextFieldSize.medium:
        return UITypography.fontSizeBase;
      case CustomTextFieldSize.large:
        return UITypography.fontSizeLG;
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultBgColor = backgroundColor ?? UIColors.background;
    final defaultBorderColor = borderColor ?? UIColors.border;
    final defaultFocusedBorderColor = focusedBorderColor ?? UIColors.primary;
    final defaultTextColor = textColor ?? UIColors.foreground;
    final defaultLabelColor = labelColor ?? UIColors.mutedForeground;
    final defaultBorderRadius = borderRadius ?? 8.0;
    final defaultContentPadding = contentPadding ?? _getDefaultPadding();
    final defaultBorderWidth = borderWidth ?? 1.5;
    final defaultFontSize = fontSize ?? _getDefaultFontSize();
    final defaultFontWeight = fontWeight ?? UITypography.fontWeightNormal;

    return Semantics(
      textField: true,
      enabled: enabled,
      label: semanticLabel ?? label,
      hint: placeholder,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        onChanged: onChanged,
        maxLines: maxLines,
        enabled: enabled,
        style: TextStyle(
          color: defaultTextColor,
          fontSize: defaultFontSize,
          fontWeight: defaultFontWeight,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: defaultLabelColor,
            fontSize: defaultFontSize,
          ),
          hintText: placeholder,
          hintStyle: TextStyle(
            color: UIColors.mutedForeground,
            fontSize: defaultFontSize,
          ),
          helperText: helperText,
          errorText: errorText,
          filled: true,
          fillColor: defaultBgColor,
          contentPadding: defaultContentPadding,
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, color: UIColors.mutedForeground)
              : null,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  icon: Icon(suffixIcon, color: UIColors.mutedForeground),
                  onPressed: onSuffixIconTap,
                  tooltip: obscureText ? 'Toggle password visibility' : null,
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultBorderRadius),
            borderSide: BorderSide(
              color: defaultBorderColor,
              width: defaultBorderWidth,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultBorderRadius),
            borderSide: BorderSide(
              color: defaultFocusedBorderColor,
              width: defaultBorderWidth,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultBorderRadius),
            borderSide: BorderSide(
              color: UIColors.error,
              width: defaultBorderWidth,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultBorderRadius),
            borderSide: BorderSide(
              color: UIColors.error,
              width: defaultBorderWidth,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultBorderRadius),
            borderSide: BorderSide(
              color: UIColors.border,
              width: defaultBorderWidth,
            ),
          ),
        ),
      ),
    );
  }
}
