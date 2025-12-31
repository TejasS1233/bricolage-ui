import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';
import '../theme/radius.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onDeleted;
  final Color? backgroundColor;
  final Color? labelColor;
  final double? borderRadius;

  const CustomChip({
    super.key,
    required this.label,
    this.icon,
    this.onDeleted,
    this.backgroundColor,
    this.labelColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      avatar: icon != null ? Icon(icon, size: 16) : null,
      deleteIcon: onDeleted != null ? const Icon(Icons.close, size: 18) : null,
      onDeleted: onDeleted,
      backgroundColor: backgroundColor ?? UIColors.muted,
      labelStyle: TextStyle(
        color: labelColor ?? UIColors.foreground,
        fontSize: UITypography.fontSizeSM,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? UIRadius.full),
      ),
    );
  }
}
