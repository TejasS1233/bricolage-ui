import 'package:flutter/material.dart';
import '../theme/colors.dart';

class CustomDivider extends StatelessWidget {
  final double? height;
  final double? thickness;
  final Color? color;
  final double? indent;
  final double? endIndent;

  const CustomDivider({
    super.key,
    this.height,
    this.thickness,
    this.color,
    this.indent,
    this.endIndent,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height ?? 1,
      thickness: thickness ?? 1,
      color: color ?? UIColors.border,
      indent: indent,
      endIndent: endIndent,
    );
  }
}

class CustomVerticalDivider extends StatelessWidget {
  final double? width;
  final double? thickness;
  final Color? color;
  final double? indent;
  final double? endIndent;

  const CustomVerticalDivider({
    super.key,
    this.width,
    this.thickness,
    this.color,
    this.indent,
    this.endIndent,
  });

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      width: width ?? 1,
      thickness: thickness ?? 1,
      color: color ?? UIColors.border,
      indent: indent,
      endIndent: endIndent,
    );
  }
}
