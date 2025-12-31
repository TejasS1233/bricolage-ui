import 'package:flutter/material.dart';

class BreadcrumbItem {
  final String label;
  final VoidCallback? onTap;
  final IconData? icon;

  const BreadcrumbItem({
    required this.label,
    this.onTap,
    this.icon,
  });
}

class CustomBreadcrumb extends StatelessWidget {
  final List<BreadcrumbItem> items;
  final Widget separator;
  final Color? textColor;
  final Color? activeTextColor;
  final double fontSize;
  final double iconSize;

  const CustomBreadcrumb({
    super.key,
    required this.items,
    this.separator = const Icon(Icons.chevron_right, size: 16),
    this.textColor,
    this.activeTextColor,
    this.fontSize = 14.0,
    this.iconSize = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        final isLast = index == items.length - 1;

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: !isLast ? item.onTap : null,
              child: MouseRegion(
                cursor: !isLast && item.onTap != null
                    ? SystemMouseCursors.click
                    : SystemMouseCursors.basic,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (item.icon != null) ...[
                      Icon(
                        item.icon,
                        size: iconSize,
                        color: isLast
                            ? (activeTextColor ?? Colors.black87)
                            : (textColor ?? Colors.grey[600]),
                      ),
                      const SizedBox(width: 6),
                    ],
                    Text(
                      item.label,
                      style: TextStyle(
                        fontSize: fontSize,
                        color: isLast
                            ? (activeTextColor ?? Colors.black87)
                            : (textColor ?? Colors.grey[600]),
                        fontWeight: isLast ? FontWeight.w600 : FontWeight.normal,
                        decoration: !isLast && item.onTap != null
                            ? TextDecoration.underline
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (!isLast) ...[
              const SizedBox(width: 8),
              separator,
            ],
          ],
        );
      }).toList(),
    );
  }
}
