import 'package:flutter/material.dart';
import '../theme/theme.dart';

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
    this.fontSize = UITypography.fontSizeSM,
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
                  color: labelColor ?? UIColors.gray700,
                ),
              ),
              if (required)
                Text(
                  ' *',
                  style: TextStyle(
                    fontSize: fontSize,
                    color: errorColor ?? UIColors.error,
                  ),
                ),
            ],
          ),
        if (label != null) const SizedBox(height: UISpacing.sm),
        if (hint != null) ...[
          Text(
            hint!,
            style: TextStyle(
              fontSize: fontSize - 2,
              color: UIColors.gray600,
            ),
          ),
          const SizedBox(height: UISpacing.sm),
        ],
        child,
        if (errorText != null) ...[
          const SizedBox(height: UISpacing.xs * 1.5),
          Row(
            children: [
              Icon(
                Icons.error_outline,
                size: 14,
                color: errorColor ?? UIColors.error,
              ),
              const SizedBox(width: UISpacing.xs * 1.5),
              Text(
                errorText!,
                style: TextStyle(
                  fontSize: fontSize - 2,
                  color: errorColor ?? UIColors.error,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
