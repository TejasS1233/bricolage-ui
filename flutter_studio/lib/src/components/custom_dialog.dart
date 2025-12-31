import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';
import '../theme/radius.dart';

class CustomDialog {
  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required String description,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(UIRadius.lg),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: UITypography.fontWeightSemiBold,
                    color: UIColors.foreground,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: UIColors.mutedForeground,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (cancelText != null)
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: TextButton.styleFrom(
                          foregroundColor: UIColors.mutedForeground,
                        ),
                        child: Text(cancelText),
                      ),
                    if (cancelText != null) const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        if (onConfirm != null) onConfirm();
                        Navigator.of(context).pop(true);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: UIColors.primary,
                        foregroundColor: UIColors.primaryForeground,
                      ),
                      child: Text(confirmText ?? 'OK'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
