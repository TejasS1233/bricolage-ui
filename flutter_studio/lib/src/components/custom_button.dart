import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';

enum CustomButtonVariant { filled, outlined, text, icon }

enum CustomButtonSize { small, medium, large }

/// A highly customizable button component
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final CustomButtonVariant variant;
  final CustomButtonSize size;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsets? padding;
  final double? elevation;
  final IconData? icon;
  final bool fullWidth;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.variant = CustomButtonVariant.filled,
    this.size = CustomButtonSize.medium,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.elevation,
    this.icon,
    this.fullWidth = false,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  EdgeInsets _getDefaultPadding() {
    switch (size) {
      case CustomButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
      case CustomButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 10);
      case CustomButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 14);
    }
  }

  double _getDefaultFontSize() {
    switch (size) {
      case CustomButtonSize.small:
        return UITypography.fontSizeSM;
      case CustomButtonSize.medium:
        return UITypography.fontSizeBase;
      case CustomButtonSize.large:
        return UITypography.fontSizeLG;
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultBgColor = backgroundColor ?? UIColors.primary;
    final defaultTextColor = textColor ?? UIColors.white;
    final defaultBorderColor = borderColor ?? UIColors.primary;
    final defaultBorderRadius = borderRadius ?? 8.0;
    final defaultPadding = padding ?? _getDefaultPadding();
    final defaultFontSize = fontSize ?? _getDefaultFontSize();
    final defaultFontWeight = fontWeight ?? UITypography.fontWeightMedium;

    Widget buttonContent = Row(
      mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Icon(
            icon,
            color: variant == CustomButtonVariant.filled
                ? defaultTextColor
                : defaultBgColor,
            size: defaultFontSize * 1.2,
          ),
          const SizedBox(width: 8),
        ],
        Text(
          text,
          style: TextStyle(
            color: variant == CustomButtonVariant.filled
                ? defaultTextColor
                : defaultBgColor,
            fontSize: defaultFontSize,
            fontWeight: defaultFontWeight,
          ),
        ),
      ],
    );

    switch (variant) {
      case CustomButtonVariant.filled:
        return SizedBox(
          width: fullWidth ? double.infinity : null,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: defaultBgColor,
              padding: defaultPadding,
              elevation: elevation ?? 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
              ),
            ),
            child: buttonContent,
          ),
        );

      case CustomButtonVariant.outlined:
        return SizedBox(
          width: fullWidth ? double.infinity : null,
          child: OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              padding: defaultPadding,
              side: BorderSide(color: defaultBorderColor, width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
              ),
            ),
            child: buttonContent,
          ),
        );

      case CustomButtonVariant.text:
        return SizedBox(
          width: fullWidth ? double.infinity : null,
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              padding: defaultPadding,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
              ),
            ),
            child: buttonContent,
          ),
        );

      case CustomButtonVariant.icon:
        return IconButton(
          onPressed: onPressed,
          icon: Icon(icon ?? Icons.circle, color: defaultTextColor),
          iconSize: defaultFontSize * 1.5,
          style: IconButton.styleFrom(
            backgroundColor: defaultBgColor,
            padding: defaultPadding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultBorderRadius),
            ),
          ),
        );
    }
  }
}
