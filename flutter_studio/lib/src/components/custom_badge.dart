import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';
import '../theme/radius.dart';

enum CustomBadgeVariant { default_, secondary, destructive, outline, success }

class CustomBadge extends StatelessWidget {
  final String text;
  final CustomBadgeVariant variant;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsets? padding;
  final double? fontSize;

  const CustomBadge({
    super.key,
    required this.text,
    this.variant = CustomBadgeVariant.default_,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color fgColor;
    Color? bColor;

    switch (variant) {
      case CustomBadgeVariant.default_:
        bgColor = backgroundColor ?? UIColors.primary;
        fgColor = foregroundColor ?? UIColors.primaryForeground;
        break;
      case CustomBadgeVariant.secondary:
        bgColor = backgroundColor ?? UIColors.muted;
        fgColor = foregroundColor ?? UIColors.mutedForeground;
        break;
      case CustomBadgeVariant.destructive:
        bgColor = backgroundColor ?? UIColors.destructive;
        fgColor = foregroundColor ?? UIColors.destructiveForeground;
        break;
      case CustomBadgeVariant.outline:
        bgColor = backgroundColor ?? Colors.transparent;
        fgColor = foregroundColor ?? UIColors.foreground;
        bColor = borderColor ?? UIColors.border;
        break;
      case CustomBadgeVariant.success:
        bgColor = backgroundColor ?? UIColors.success;
        fgColor = foregroundColor ?? UIColors.successForeground;
        break;
    }

    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(borderRadius ?? UIRadius.full),
        border: bColor != null ? Border.all(color: bColor, width: 1) : null,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: fgColor,
          fontSize: fontSize ?? UITypography.fontSizeXS,
          fontWeight: UITypography.fontWeightMedium,
        ),
      ),
    );
  }
}
