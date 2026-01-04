import 'package:flutter/material.dart';
import '../theme/theme.dart';

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
    this.titleFontSize = UITypography.fontSizeLG,
    this.descriptionFontSize = UITypography.fontSizeSM,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(UISpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Icon(
                icon,
                size: iconSize,
                color: iconColor ?? UIColors.gray400,
              ),
            if (icon != null) const SizedBox(height: UISpacing.md),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.w600,
                color: titleColor ?? UIColors.gray800,
              ),
            ),
            if (description != null) ...[
              const SizedBox(height: UISpacing.sm),
              Text(
                description!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: descriptionFontSize,
                  color: descriptionColor ?? UIColors.gray600,
                ),
              ),
            ],
            if (action != null) ...[
              const SizedBox(height: UISpacing.lg),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}
