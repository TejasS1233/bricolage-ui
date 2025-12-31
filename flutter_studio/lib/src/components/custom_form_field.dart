import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorText;
  final bool required;
  final Widget child;
  final Color? labelColor;
  final Color? errorColor;
  final double fontSize;

  const CustomFormField({
    super.key,
    this.label,
    this.hint,
    this.errorText,
    this.required = false,
    required this.child,
    this.labelColor,
    this.errorColor,
    this.fontSize = 14.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null)
          Row(
            children: [
              Text(
                label!,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                  color: labelColor ?? Colors.grey[700],
                ),
              ),
              if (required)
                Text(
                  ' *',
                  style: TextStyle(
                    fontSize: fontSize,
                    color: errorColor ?? Colors.red,
                  ),
                ),
            ],
          ),
        if (label != null) const SizedBox(height: 8),
        if (hint != null) ...[
          Text(
            hint!,
            style: TextStyle(
              fontSize: fontSize - 2,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
        ],
        child,
        if (errorText != null) ...[
          const SizedBox(height: 6),
          Row(
            children: [
              Icon(
                Icons.error_outline,
                size: 14,
                color: errorColor ?? Colors.red,
              ),
              const SizedBox(width: 6),
              Text(
                errorText!,
                style: TextStyle(
                  fontSize: fontSize - 2,
                  color: errorColor ?? Colors.red,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
