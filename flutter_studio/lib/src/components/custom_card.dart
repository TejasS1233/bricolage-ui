import 'package:flutter/material.dart';
import '../theme/colors.dart';

enum CustomCardVariant { elevated, outlined, filled }

/// A customizable card component
class CustomCard extends StatelessWidget {
  final Widget child;
  final CustomCardVariant variant;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? elevation;
  final double? borderWidth;
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  const CustomCard({
    Key? key,
    required this.child,
    this.variant = CustomCardVariant.elevated,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.margin,
    this.elevation,
    this.borderWidth,
    this.onTap,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultBgColor = backgroundColor ?? UIColors.white;
    final defaultBorderColor = borderColor ?? UIColors.gray200;
    final defaultBorderRadius = borderRadius ?? 12.0;
    final defaultPadding = padding ?? const EdgeInsets.all(16.0);
    final defaultMargin = margin ?? EdgeInsets.zero;
    final defaultElevation = elevation ?? 2.0;
    final defaultBorderWidth = borderWidth ?? 1.0;

    Widget cardContent = Container(
      width: width,
      height: height,
      padding: defaultPadding,
      child: child,
    );

    BoxDecoration decoration;

    switch (variant) {
      case CustomCardVariant.elevated:
        decoration = BoxDecoration(
          color: defaultBgColor,
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          boxShadow: [
            BoxShadow(
              color: UIColors.gray900.withOpacity(0.1),
              blurRadius: defaultElevation * 2,
              offset: Offset(0, defaultElevation),
            ),
          ],
        );
        break;

      case CustomCardVariant.outlined:
        decoration = BoxDecoration(
          color: defaultBgColor,
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          border: Border.all(
            color: defaultBorderColor,
            width: defaultBorderWidth,
          ),
        );
        break;

      case CustomCardVariant.filled:
        decoration = BoxDecoration(
          color: defaultBgColor,
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        );
        break;
    }

    Widget card = Container(
      margin: defaultMargin,
      decoration: decoration,
      child: cardContent,
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        child: card,
      );
    }

    return card;
  }
}
