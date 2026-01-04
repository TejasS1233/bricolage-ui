import 'package:flutter/material.dart';
import '../theme/theme.dart';

class CustomTextarea extends StatelessWidget {
  final String? label;
  final String? placeholder;
  final int maxLines;
  final int? maxLength;
  final TextEditingController? controller;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? textColor;
  final Color? labelColor;
  final double borderRadius;
  final double borderWidth;
  final double fontSize;
  final EdgeInsets? padding;
  final bool enabled;

  const CustomTextarea({
    super.key,
    this.label,
    this.placeholder,
    this.maxLines = 4,
    this.maxLength,
    this.controller,
    this.initialValue,
    this.onChanged,
    this.backgroundColor,
    this.borderColor,
    this.focusedBorderColor,
    this.textColor,
    this.labelColor,
    this.borderRadius = UIRadius.md,
    this.borderWidth = 1.5,
    this.fontSize = UITypography.fontSizeSM,
    this.padding,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              color: labelColor ?? UIColors.mutedForeground,
            ),
          ),
          const SizedBox(height: UISpacing.sm),
        ],
        TextField(
          controller: controller,
          onChanged: onChanged,
          enabled: enabled,
          maxLines: maxLines,
          maxLength: maxLength,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor ?? UIColors.foreground,
          ),
          decoration: InputDecoration(
            hintText: placeholder,
            filled: true,
            fillColor: backgroundColor ?? UIColors.background,
            contentPadding:
                padding ?? const EdgeInsets.all(UISpacing.md / 1.33),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: borderColor ?? UIColors.border,
                width: borderWidth,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: borderColor ?? UIColors.border,
                width: borderWidth,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: focusedBorderColor ?? UIColors.primary,
                width: borderWidth,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: UIColors.gray200,
                width: borderWidth,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
