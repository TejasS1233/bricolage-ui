import 'package:flutter/material.dart';

class CustomEmpty extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String? description;
  final Widget? action;
  final Color? iconColor;
  final Color? titleColor;
  final Color? descriptionColor;
  final double iconSize;
  final double titleFontSize;
  final double descriptionFontSize;

  const CustomEmpty({
    super.key,
    this.icon,
    required this.title,
    this.description,
    this.action,
    this.iconColor,
    this.titleColor,
    this.descriptionColor,
    this.iconSize = 64.0,
    this.titleFontSize = 18.0,
    this.descriptionFontSize = 14.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Icon(
                icon,
                size: iconSize,
                color: iconColor ?? Colors.grey[400],
              ),
            if (icon != null) const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.w600,
                color: titleColor ?? Colors.grey[800],
              ),
            ),
            if (description != null) ...[
              const SizedBox(height: 8),
              Text(
                description!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: descriptionFontSize,
                  color: descriptionColor ?? Colors.grey[600],
                ),
              ),
            ],
            if (action != null) ...[
              const SizedBox(height: 24),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}
