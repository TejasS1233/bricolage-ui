import 'package:flutter/material.dart';
import '../theme/theme.dart';

class CustomTooltip extends StatelessWidget {
  final String message;
  final Widget child;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomTooltip({
    super.key,
    required this.message,
    required this.child,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      decoration: BoxDecoration(
        color: backgroundColor ?? UIColors.foreground,
        borderRadius: BorderRadius.circular(UIRadius.md),
      ),
      textStyle: TextStyle(
        color: textColor ?? UIColors.background,
        fontSize: UITypography.fontSizeSM,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: child,
    );
  }
}
