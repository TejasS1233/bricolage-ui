import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Custom color palette for the UI library
class UIColors {
  // Primary colors
  static const Color primary = Color(0xFF6366F1);
  static const Color primaryDark = Color(0xFF4F46E5);
  static const Color primaryLight = Color(0xFF818CF8);

  // Secondary colors
  static const Color secondary = Color(0xFF8B5CF6);
  static const Color secondaryDark = Color(0xFF7C3AED);
  static const Color secondaryLight = Color(0xFFA78BFA);

  // Neutral colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color gray50 = Color(0xFFF9FAFB);
  static const Color gray100 = Color(0xFFF3F4F6);
  static const Color gray200 = Color(0xFFE5E7EB);
  static const Color gray300 = Color(0xFFD1D5DB);
  static const Color gray400 = Color(0xFF9CA3AF);
  static const Color gray500 = Color(0xFF6B7280);
  static const Color gray600 = Color(0xFF4B5563);
  static const Color gray700 = Color(0xFF374151);
  static const Color gray800 = Color(0xFF1F2937);
  static const Color gray900 = Color(0xFF111827);

  // Semantic colors
  static const Color success = Color(0xFF10B981);
  static const Color successForeground = Color(0xFFFAFAFA);

  static const Color warning = Color(0xFFF59E0B);
  static const Color warningForeground = Color(0xFF18181B);

  static const Color error = Color(0xFFEF4444);
  static const Color errorForeground = Color(0xFFFAFAFA);

  static const Color destructive = Color(0xFFDC2626);
  static const Color destructiveForeground = Color(0xFFFAFAFA);

  static const Color info = Color(0xFF3B82F6);
  static const Color infoForeground = Color(0xFFFAFAFA);

  // shadcn-style colors
  static const Color background = Color(0xFFFFFFFF);
  static const Color foreground = Color(0xFF09090B);
  static const Color muted = Color(0xFFF4F4F5);
  static const Color mutedForeground = Color(0xFF71717A);
  static const Color border = Color(0xFFE4E4E7);
  static const Color input = Color(0xFFE4E4E7);
  static const Color ring = Color(0xFF3B82F6);

  static const Color primaryForeground = Color(0xFFFAFAFA);
  static const Color secondaryForeground = Color(0xFFFAFAFA);
}

/// Typography constants for the UI library
class UITypography {
  // Font sizes
  static const double fontSizeXS = 12.0;
  static const double fontSizeSM = 14.0;
  static const double fontSizeBase = 16.0;
  static const double fontSizeLG = 18.0;
  static const double fontSizeXL = 20.0;
  static const double fontSize2XL = 24.0;
  static const double fontSize3XL = 30.0;
  static const double fontSize4XL = 36.0;

  // Font weights
  static const FontWeight fontWeightLight = FontWeight.w300;
  static const FontWeight fontWeightNormal = FontWeight.w400;
  static const FontWeight fontWeightMedium = FontWeight.w500;
  static const FontWeight fontWeightSemiBold = FontWeight.w600;
  static const FontWeight fontWeightBold = FontWeight.w700;

  // Text styles
  static const TextStyle heading1 = TextStyle(
    fontSize: fontSize4XL,
    fontWeight: fontWeightBold,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: fontSize3XL,
    fontWeight: fontWeightBold,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: fontSize2XL,
    fontWeight: fontWeightSemiBold,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: fontSizeLG,
    fontWeight: fontWeightNormal,
  );

  static const TextStyle body = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeightNormal,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: fontSizeSM,
    fontWeight: fontWeightNormal,
  );

  static const TextStyle caption = TextStyle(
    fontSize: fontSizeXS,
    fontWeight: fontWeightNormal,
  );
}

/// Border radius constants for the UI library
class UIRadius {
  static const double sm = 4.0;
  static const double md = 8.0;
  static const double lg = 12.0;
  static const double xl = 16.0;
  static const double xxl = 24.0;
  static const double full = 9999.0;
}

/// Spacing constants for the UI library
class UISpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
}

/// Border width constants for the UI library
class UIBorder {
  static const double thin = 1.0;
  static const double medium = 1.5;
  static const double thick = 2.0;
}

/// Shadow constants for the UI library
class UIShadows {
  static const BoxShadow sm = BoxShadow(
    color: Color(0x0D000000),
    blurRadius: 2,
    offset: Offset(0, 1),
  );

  static const BoxShadow md = BoxShadow(
    color: Color(0x1A000000),
    blurRadius: 4,
    offset: Offset(0, 2),
  );

  static const BoxShadow lg = BoxShadow(
    color: Color(0x1A000000),
    blurRadius: 8,
    offset: Offset(0, 4),
  );

  static const BoxShadow xl = BoxShadow(
    color: Color(0x1A000000),
    blurRadius: 16,
    offset: Offset(0, 8),
  );
}

class UIEffects {
  UIEffects._();

  /// Apply glassmorphism decoration to a container
  static BoxDecoration glassDecoration({
    required Color baseColor,
    double blur = 10.0,
    double opacity = 0.2,
    double radiusScale = 1.0,
    Color? borderColor,
  }) {
    return BoxDecoration(
      color: baseColor.withValues(alpha: opacity),
      borderRadius: BorderRadius.circular(12 * radiusScale),
      border: Border.all(
        color: (borderColor ?? UIColors.white).withValues(alpha: 0.2),
        width: UIBorder.medium,
      ),
    );
  }

  /// Apply neumorphism decoration with soft shadows
  static BoxDecoration neumorphismDecoration({
    required Color baseColor,
    double intensity = 0.5,
    double radiusScale = 1.0,
    bool isPressed = false,
  }) {
    final isDark = baseColor.computeLuminance() < 0.5;
    final lightColor = isDark
        ? UIColors.white.withValues(alpha: 0.1 * intensity)
        : UIColors.white.withValues(alpha: 0.7 * intensity);
    final darkColor = isDark
        ? UIColors.black.withValues(alpha: 0.5 * intensity)
        : UIColors.black.withValues(alpha: 0.15 * intensity);

    final offset = isPressed ? 2.0 : 4.0 * intensity;
    final blur = isPressed ? 4.0 : 8.0 * intensity;

    return BoxDecoration(
      color: baseColor,
      borderRadius: BorderRadius.circular(12 * radiusScale),
      boxShadow: [
        BoxShadow(
          color: darkColor,
          offset: Offset(offset, offset),
          blurRadius: blur,
        ),
        BoxShadow(
          color: lightColor,
          offset: Offset(-offset, -offset),
          blurRadius: blur,
        ),
      ],
    );
  }

  /// Create a gradient decoration
  static BoxDecoration gradientDecoration({
    required Color startColor,
    required Color endColor,
    double angle = 135.0,
    double radiusScale = 1.0,
  }) {
    final angleRad = angle * (math.pi / 180);
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment(-math.cos(angleRad), -math.sin(angleRad)),
        end: Alignment(math.cos(angleRad), math.sin(angleRad)),
        colors: [startColor, endColor],
      ),
      borderRadius: BorderRadius.circular(12 * radiusScale),
    );
  }

  /// Get glow shadows for border glow effect
  static List<BoxShadow> glowShadows({
    required Color color,
    double intensity = 0.5,
    double spread = 4.0,
  }) {
    return [
      BoxShadow(
        color: color.withValues(alpha: intensity),
        blurRadius: spread * 2,
        spreadRadius: spread / 2,
      ),
    ];
  }
}

/// Glass Container - A widget that applies glassmorphism effect
class GlassContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final double blur;
  final double opacity;

  const GlassContainer({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.blur = 10.0,
    this.opacity = 0.2,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Theme.of(context).cardColor;
    final radius = borderRadius ?? BorderRadius.circular(12);

    return ClipRRect(
      borderRadius: radius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: bgColor.withValues(alpha: opacity),
            borderRadius: radius,
            border: Border.all(
              color: UIColors.white.withValues(alpha: 0.3),
              width: UIBorder.medium,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

/// Neumorphic Container - A widget that applies neumorphism effect
class NeumorphicContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final double intensity;
  final bool isPressed;

  const NeumorphicContainer({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.intensity = 0.5,
    this.isPressed = false,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Theme.of(context).cardColor;

    return Container(
      padding: padding,
      decoration: UIEffects.neumorphismDecoration(
        baseColor: bgColor,
        intensity: intensity,
        radiusScale: 1.0,
        isPressed: isPressed,
      ).copyWith(borderRadius: borderRadius),
      child: child,
    );
  }
}

/// Gradient Container - A widget that applies gradient effect
class GradientContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color startColor;
  final Color endColor;
  final double angle;

  const GradientContainer({
    super.key,
    required this.child,
    required this.startColor,
    required this.endColor,
    this.padding,
    this.borderRadius,
    this.angle = 135.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: UIEffects.gradientDecoration(
        startColor: startColor,
        endColor: endColor,
        angle: angle,
      ).copyWith(borderRadius: borderRadius),
      child: child,
    );
  }
}

/// Glow Container - A widget that applies border glow effect
class GlowContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color glowColor;
  final double intensity;
  final double spread;

  const GlowContainer({
    super.key,
    required this.child,
    required this.glowColor,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.intensity = 0.5,
    this.spread = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Theme.of(context).cardColor;
    final radius = borderRadius ?? BorderRadius.circular(12);

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: radius,
        boxShadow: UIEffects.glowShadows(
          color: glowColor,
          intensity: intensity,
          spread: spread,
        ),
      ),
      child: child,
    );
  }
}

/// Animated Hover Container - A widget with hover/tap scale animation
class HoverScaleContainer extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double scale;
  final Duration duration;

  const HoverScaleContainer({
    super.key,
    required this.child,
    this.onTap,
    this.scale = 1.02,
    this.duration = const Duration(milliseconds: 200),
  });

  @override
  State<HoverScaleContainer> createState() => _HoverScaleContainerState();
}

class _HoverScaleContainerState extends State<HoverScaleContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: widget.duration,
          transform: _isHovered
              ? Matrix4.diagonal3Values(widget.scale, widget.scale, 1.0)
              : Matrix4.identity(),
          transformAlignment: Alignment.center,
          child: widget.child,
        ),
      ),
    );
  }
}
