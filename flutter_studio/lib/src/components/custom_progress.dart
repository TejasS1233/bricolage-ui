import 'package:flutter/material.dart';
import '../theme/colors.dart';

enum ProgressVariant { linear, circular }

class CustomProgress extends StatelessWidget {
  final double? value;
  final ProgressVariant variant;
  final Color? color;
  final Color? backgroundColor;
  final double? size;
  final double? strokeWidth;

  const CustomProgress({
    super.key,
    this.value,
    this.variant = ProgressVariant.linear,
    this.color,
    this.backgroundColor,
    this.size,
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    if (variant == ProgressVariant.circular) {
      return SizedBox(
        width: size ?? 40,
        height: size ?? 40,
        child: CircularProgressIndicator(
          value: value,
          strokeWidth: strokeWidth ?? 4,
          valueColor: AlwaysStoppedAnimation<Color>(color ?? UIColors.primary),
          backgroundColor: backgroundColor ?? UIColors.muted,
        ),
      );
    }

    return LinearProgressIndicator(
      value: value,
      valueColor: AlwaysStoppedAnimation<Color>(color ?? UIColors.primary),
      backgroundColor: backgroundColor ?? UIColors.muted,
      minHeight: size ?? 4,
    );
  }
}
