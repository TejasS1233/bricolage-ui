import 'package:flutter/material.dart';
import '../theme/typography.dart';

enum CustomButtonVariant { filled, outlined, text, icon }

enum CustomButtonSize { small, medium, large }

/// A highly customizable button component with micro-animations and accessibility support
class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final CustomButtonVariant variant;
  final CustomButtonSize size;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsets? padding;
  final double? elevation;
  final IconData? icon;
  final bool fullWidth;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.variant = CustomButtonVariant.filled,
    this.size = CustomButtonSize.medium,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.elevation,
    this.icon,
    this.fullWidth = false,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    _scaleController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    _scaleController.reverse();
  }

  void _handleTapCancel() {
    _scaleController.reverse();
  }

  EdgeInsets _getDefaultPadding() {
    switch (widget.size) {
      case CustomButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
      case CustomButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 10);
      case CustomButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 14);
    }
  }

  double _getDefaultFontSize() {
    switch (widget.size) {
      case CustomButtonSize.small:
        return UITypography.fontSizeSM;
      case CustomButtonSize.medium:
        return UITypography.fontSizeBase;
      case CustomButtonSize.large:
        return UITypography.fontSizeLG;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final defaultBgColor = widget.backgroundColor ?? colorScheme.primary;
    final defaultTextColor = widget.textColor ?? colorScheme.onPrimary;
    final defaultBorderColor = widget.borderColor ?? colorScheme.primary;
    final defaultBorderRadius = widget.borderRadius ?? 8.0;
    final defaultPadding = widget.padding ?? _getDefaultPadding();
    final defaultFontSize = widget.fontSize ?? _getDefaultFontSize();
    final defaultFontWeight =
        widget.fontWeight ?? UITypography.fontWeightMedium;
    Widget buttonContent = Row(
      mainAxisSize: widget.fullWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.icon != null) ...[
          Icon(
            widget.icon,
            color: widget.variant == CustomButtonVariant.filled
                ? defaultTextColor
                : defaultBgColor,
            size: defaultFontSize * 1.2,
          ),
          const SizedBox(width: 8),
        ],
        Text(
          widget.text,
          style: TextStyle(
            color: widget.variant == CustomButtonVariant.filled
                ? defaultTextColor
                : defaultBgColor,
            fontSize: defaultFontSize,
            fontWeight: defaultFontWeight,
          ),
        ),
      ],
    );

    // Wrap with ScaleTransition for micro-animation
    Widget animatedButton = ScaleTransition(
      scale: _scaleAnimation,
      child: Semantics(
        button: true,
        enabled: widget.onPressed != null,
        label: widget.text,
        hint: widget.onPressed == null ? 'Button is disabled' : null,
        child: _buildButtonVariant(
          buttonContent,
          defaultBgColor,
          defaultTextColor,
          defaultBorderColor,
          defaultBorderRadius,
          defaultPadding,
          defaultFontSize,
        ),
      ),
    );

    return GestureDetector(
      onTapDown: widget.onPressed != null ? _handleTapDown : null,
      onTapUp: widget.onPressed != null ? _handleTapUp : null,
      onTapCancel: widget.onPressed != null ? _handleTapCancel : null,
      child: animatedButton,
    );
  }

  Widget _buildButtonVariant(
    Widget buttonContent,
    Color defaultBgColor,
    Color defaultTextColor,
    Color defaultBorderColor,
    double defaultBorderRadius,
    EdgeInsets defaultPadding,
    double defaultFontSize,
  ) {
    switch (widget.variant) {
      case CustomButtonVariant.filled:
        return SizedBox(
          width: widget.fullWidth ? double.infinity : null,
          child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: defaultBgColor,
              padding: defaultPadding,
              elevation: widget.elevation ?? 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
              ),
            ),
            child: buttonContent,
          ),
        );

      case CustomButtonVariant.outlined:
        return SizedBox(
          width: widget.fullWidth ? double.infinity : null,
          child: OutlinedButton(
            onPressed: widget.onPressed,
            style: OutlinedButton.styleFrom(
              padding: defaultPadding,
              side: BorderSide(color: defaultBorderColor, width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
              ),
            ),
            child: buttonContent,
          ),
        );

      case CustomButtonVariant.text:
        return SizedBox(
          width: widget.fullWidth ? double.infinity : null,
          child: TextButton(
            onPressed: widget.onPressed,
            style: TextButton.styleFrom(
              padding: defaultPadding,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
              ),
            ),
            child: buttonContent,
          ),
        );

      case CustomButtonVariant.icon:
        return IconButton(
          onPressed: widget.onPressed,
          icon: Icon(widget.icon ?? Icons.circle, color: defaultTextColor),
          iconSize: defaultFontSize * 1.5,
          tooltip: widget.text,
          style: IconButton.styleFrom(
            backgroundColor: defaultBgColor,
            padding: defaultPadding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultBorderRadius),
            ),
          ),
        );
    }
  }
}
