import 'package:flutter/material.dart';
import '../theme/theme.dart';

enum CustomAvatarSize { sm, md, lg, xl }

class CustomAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? initials;
  final IconData? icon;
  final CustomAvatarSize size;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? borderRadius;

  const CustomAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.icon,
    this.size = CustomAvatarSize.md,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
  });

  double get _size {
    switch (size) {
      case CustomAvatarSize.sm:
        return 32;
      case CustomAvatarSize.md:
        return 40;
      case CustomAvatarSize.lg:
        return 48;
      case CustomAvatarSize.xl:
        return 64;
    }
  }

  double get _fontSize {
    switch (size) {
      case CustomAvatarSize.sm:
        return 12;
      case CustomAvatarSize.md:
        return 14;
      case CustomAvatarSize.lg:
        return 18;
      case CustomAvatarSize.xl:
        return 24;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        color: backgroundColor ?? UIColors.muted,
        borderRadius: BorderRadius.circular(borderRadius ?? UIRadius.full),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? UIRadius.full),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (imageUrl != null) {
      return Image.network(
        imageUrl!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildFallback(),
      );
    }

    return _buildFallback();
  }

  Widget _buildFallback() {
    if (initials != null) {
      return Center(
        child: Text(
          initials!,
          style: TextStyle(
            color: foregroundColor ?? UIColors.mutedForeground,
            fontSize: _fontSize,
            fontWeight: UITypography.fontWeightMedium,
          ),
        ),
      );
    }

    return Icon(
      icon ?? Icons.person,
      color: foregroundColor ?? UIColors.mutedForeground,
      size: _size * 0.6,
    );
  }
}
