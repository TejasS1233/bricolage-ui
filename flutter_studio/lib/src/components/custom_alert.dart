import 'package:flutter/material.dart';
import '../theme/theme.dart';

enum CustomAlertVariant { default_, destructive, success, warning, info }

class CustomAlert extends StatelessWidget {
  final String title;
  final String? description;
  final CustomAlertVariant variant;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final double? borderRadius;
  final VoidCallback? onClose;

  const CustomAlert({
    super.key,
    required this.title,
    this.description,
    this.variant = CustomAlertVariant.default_,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.borderRadius,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color fgColor;
    Color bColor;
    IconData defaultIcon;

    switch (variant) {
      case CustomAlertVariant.default_:
        bgColor = backgroundColor ?? UIColors.muted;
        fgColor = foregroundColor ?? UIColors.foreground;
        bColor = borderColor ?? UIColors.border;
        defaultIcon = Icons.info_outline;
        break;
      case CustomAlertVariant.destructive:
        bgColor = backgroundColor ?? UIColors.error.withValues(alpha: 0.1);
        fgColor = foregroundColor ?? UIColors.error;
        bColor = borderColor ?? UIColors.error;
        defaultIcon = Icons.error_outline;
        break;
      case CustomAlertVariant.success:
        bgColor = backgroundColor ?? UIColors.success.withValues(alpha: 0.1);
        fgColor = foregroundColor ?? UIColors.success;
        bColor = borderColor ?? UIColors.success;
        defaultIcon = Icons.check_circle_outline;
        break;
      case CustomAlertVariant.warning:
        bgColor = backgroundColor ?? UIColors.warning.withValues(alpha: 0.1);
        fgColor = foregroundColor ?? UIColors.warning;
        bColor = borderColor ?? UIColors.warning;
        defaultIcon = Icons.warning_amber_outlined;
        break;
      case CustomAlertVariant.info:
        bgColor = backgroundColor ?? UIColors.info.withValues(alpha: 0.1);
        fgColor = foregroundColor ?? UIColors.info;
        bColor = borderColor ?? UIColors.info;
        defaultIcon = Icons.info_outline;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(UISpacing.md),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: bColor, width: UIBorder.thin),
        borderRadius: BorderRadius.circular(borderRadius ?? UIRadius.lg),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon ?? defaultIcon,
            color: fgColor,
            size: 20,
          ),
          const SizedBox(width: UISpacing.md / 1.33),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: fgColor,
                    fontSize: UITypography.fontSizeSM,
                    fontWeight: UITypography.fontWeightMedium,
                  ),
                ),
                if (description != null) ...[
                  const SizedBox(height: UISpacing.xs),
                  Text(
                    description!,
                    style: TextStyle(
                      color: fgColor.withValues(alpha: 0.9),
                      fontSize: UITypography.fontSizeXS + 1,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (onClose != null) ...[
            const SizedBox(width: UISpacing.md / 1.33),
            InkWell(
              onTap: onClose,
              borderRadius: BorderRadius.circular(4),
              child: Icon(
                Icons.close,
                color: fgColor,
                size: 18,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
