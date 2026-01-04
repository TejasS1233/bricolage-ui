import 'package:flutter/material.dart';
import '../theme/theme.dart';

enum ToastVariant { default_, success, error, warning, info }

class CustomToast {
  static void show(
    BuildContext context, {
    required String message,
    String? title,
    ToastVariant variant = ToastVariant.default_,
    Duration duration = const Duration(seconds: 3),
    IconData? icon,
  }) {
    Color bgColor;
    Color fgColor;
    IconData defaultIcon;

    switch (variant) {
      case ToastVariant.default_:
        bgColor = UIColors.foreground;
        fgColor = UIColors.background;
        defaultIcon = Icons.info_outline;
        break;
      case ToastVariant.success:
        bgColor = UIColors.success;
        fgColor = UIColors.successForeground;
        defaultIcon = Icons.check_circle_outline;
        break;
      case ToastVariant.error:
        bgColor = UIColors.error;
        fgColor = UIColors.errorForeground;
        defaultIcon = Icons.error_outline;
        break;
      case ToastVariant.warning:
        bgColor = UIColors.warning;
        fgColor = UIColors.warningForeground;
        defaultIcon = Icons.warning_amber_outlined;
        break;
      case ToastVariant.info:
        bgColor = UIColors.info;
        fgColor = UIColors.infoForeground;
        defaultIcon = Icons.info_outline;
        break;
    }

    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 80,
        right: 16,
        child: Material(
          color: UIColors.background.withValues(alpha: 0.0),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 350),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(UIRadius.lg),
              boxShadow: const [UIShadows.lg],
            ),
            padding: const EdgeInsets.all(UISpacing.md),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon ?? defaultIcon, color: fgColor, size: 20),
                const SizedBox(width: UISpacing.md / 1.33),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (title != null)
                        Text(
                          title,
                          style: TextStyle(
                            color: fgColor,
                            fontSize: UITypography.fontSizeSM,
                            fontWeight: UITypography.fontWeightMedium,
                          ),
                        ),
                      Text(
                        message,
                        style: TextStyle(
                          color: title != null
                              ? fgColor.withValues(alpha: 0.9)
                              : fgColor,
                          fontSize: title != null
                              ? UITypography.fontSizeXS + 1
                              : UITypography.fontSizeSM,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);
    Future.delayed(duration, () => overlayEntry.remove());
  }
}
