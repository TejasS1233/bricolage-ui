import 'package:flutter/material.dart';
import '../theme/theme.dart';

enum CustomAppBarSize { small, medium, large }

/// A customizable app bar component
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final CustomAppBarSize size;
  final Color? backgroundColor;
  final Color? textColor;
  final double? elevation;
  final Widget? leading;
  final List<Widget>? actions;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool centerTitle;
  final double? titleSpacing;
  final Widget? bottom;
  final double? bottomHeight;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.size = CustomAppBarSize.medium,
    this.backgroundColor,
    this.textColor,
    this.elevation,
    this.leading,
    this.actions,
    this.fontSize,
    this.fontWeight,
    this.centerTitle = true,
    this.titleSpacing,
    this.bottom,
    this.bottomHeight,
  }) : super(key: key);

  double _getDefaultHeight() {
    switch (size) {
      case CustomAppBarSize.small:
        return 48.0;
      case CustomAppBarSize.medium:
        return 56.0;
      case CustomAppBarSize.large:
        return 64.0;
    }
  }

  double _getDefaultFontSize() {
    switch (size) {
      case CustomAppBarSize.small:
        return UITypography.fontSizeLG;
      case CustomAppBarSize.medium:
        return UITypography.fontSizeXL;
      case CustomAppBarSize.large:
        return UITypography.fontSize2XL;
    }
  }

  @override
  Size get preferredSize {
    final height = _getDefaultHeight() + (bottomHeight ?? 0);
    return Size.fromHeight(height);
  }

  @override
  Widget build(BuildContext context) {
    final defaultBgColor = backgroundColor ?? UIColors.primary;
    final defaultTextColor = textColor ?? UIColors.white;
    final defaultElevation = elevation ?? 4.0;
    final defaultFontSize = fontSize ?? _getDefaultFontSize();
    final defaultFontWeight = fontWeight ?? UITypography.fontWeightBold;

    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: defaultTextColor,
          fontSize: defaultFontSize,
          fontWeight: defaultFontWeight,
        ),
      ),
      backgroundColor: defaultBgColor,
      elevation: defaultElevation,
      centerTitle: centerTitle,
      titleSpacing: titleSpacing,
      leading: leading,
      actions: actions,
      iconTheme: IconThemeData(color: defaultTextColor),
      bottom: bottom != null
          ? PreferredSize(
              preferredSize: Size.fromHeight(bottomHeight ?? 48.0),
              child: bottom!,
            )
          : null,
    );
  }
}
