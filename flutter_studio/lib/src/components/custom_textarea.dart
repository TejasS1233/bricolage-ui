import 'package:flutter/material.dart';

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
    this.borderRadius = 8.0,
    this.borderWidth = 1.5,
    this.fontSize = 14.0,
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
              color: labelColor ?? Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
        ],
        TextField(
          controller: controller,
          onChanged: onChanged,
          enabled: enabled,
          maxLines: maxLines,
          maxLength: maxLength,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor ?? Colors.black87,
          ),
          decoration: InputDecoration(
            hintText: placeholder,
            filled: true,
            fillColor: backgroundColor ?? Colors.white,
            contentPadding: padding ?? const EdgeInsets.all(12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: borderColor ?? Colors.grey[300]!,
                width: borderWidth,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: borderColor ?? Colors.grey[300]!,
                width: borderWidth,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: focusedBorderColor ?? Colors.blue,
                width: borderWidth,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: Colors.grey[200]!,
                width: borderWidth,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
