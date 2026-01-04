import 'package:flutter/material.dart';
import '../models/global_theme.dart';

class ComponentCodeGenerator {
  /// Generate consolidated theme.dart file with all theme classes
  static String generateConsolidatedThemeFile(GlobalTheme theme) {
    final baseFontSize = 16.0 * theme.fontSizeScale;
    final baseLineHeight = 1.5 * theme.lineHeightScale;
    final intensity = theme.shadowIntensity;
    final glassBlur = theme.glassBlur;
    final glassOpacity = theme.glassOpacity;
    final neumIntensity = theme.neumorphismIntensity;
    final glowIntensity = theme.glowIntensity;
    final glowSpread = theme.glowSpread;
    final gradientAngle = theme.gradientAngle;

    String colorToHex(Color c) =>
        '0x${c.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';

    return '''import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Custom color palette for the UI library
class UIColors {
  // Primary colors
  static const Color primary = Color(${colorToHex(theme.primary)});
  static const Color primaryForeground = Color(${colorToHex(theme.primaryForeground)});
  
  // Secondary colors
  static const Color secondary = Color(${colorToHex(theme.secondary)});
  static const Color secondaryForeground = Color(${colorToHex(theme.secondaryForeground)});
  
  // Accent colors
  static const Color accent = Color(${colorToHex(theme.accent)});
  static const Color accentForeground = Color(${colorToHex(theme.accentForeground)});
  
  // Base colors
  static const Color background = Color(${colorToHex(theme.background)});
  static const Color foreground = Color(${colorToHex(theme.foreground)});
  
  // Card colors
  static const Color card = Color(${colorToHex(theme.card)});
  static const Color cardForeground = Color(${colorToHex(theme.cardForeground)});
  
  // Popover colors
  static const Color popover = Color(${colorToHex(theme.popover)});
  static const Color popoverForeground = Color(${colorToHex(theme.popoverForeground)});
  
  // Muted colors
  static const Color muted = Color(${colorToHex(theme.muted)});
  static const Color mutedForeground = Color(${colorToHex(theme.mutedForeground)});
  
  // Destructive colors
  static const Color destructive = Color(${colorToHex(theme.destructive)});
  static const Color destructiveForeground = Color(${colorToHex(theme.destructiveForeground)});
  
  // Border & Input
  static const Color border = Color(${colorToHex(theme.border)});
  static const Color input = Color(${colorToHex(theme.input)});
  static const Color ring = Color(${colorToHex(theme.ring)});
  
  // Chart colors (for data visualization)
  static const Color chart1 = Color(${colorToHex(theme.chart1)});
  static const Color chart2 = Color(${colorToHex(theme.chart2)});
  static const Color chart3 = Color(${colorToHex(theme.chart3)});
  static const Color chart4 = Color(${colorToHex(theme.chart4)});
  static const Color chart5 = Color(${colorToHex(theme.chart5)});
  
  // Neutral colors (for compatibility)
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
  
  // Semantic colors (for compatibility)
  static const Color success = Color(0xFF10B981);
  static const Color successForeground = Color(0xFFFAFAFA);
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningForeground = Color(0xFF18181B);
  static const Color error = Color(0xFFEF4444);
  static const Color errorForeground = Color(0xFFFAFAFA);
  static const Color info = Color(0xFF3B82F6);
  static const Color infoForeground = Color(0xFFFAFAFA);
}

/// Typography constants for the UI library
class UITypography {
  // Font family
  static const String fontFamily = '${theme.fontFamily}';
  
  // Font sizes (scaled)
  static const double fontSizeXS = ${(12.0 * theme.fontSizeScale).toStringAsFixed(1)};
  static const double fontSizeSM = ${(14.0 * theme.fontSizeScale).toStringAsFixed(1)};
  static const double fontSizeBase = ${baseFontSize.toStringAsFixed(1)};
  static const double fontSizeLG = ${(18.0 * theme.fontSizeScale).toStringAsFixed(1)};
  static const double fontSizeXL = ${(20.0 * theme.fontSizeScale).toStringAsFixed(1)};
  static const double fontSize2XL = ${(24.0 * theme.fontSizeScale).toStringAsFixed(1)};
  static const double fontSize3XL = ${(30.0 * theme.fontSizeScale).toStringAsFixed(1)};
  static const double fontSize4XL = ${(36.0 * theme.fontSizeScale).toStringAsFixed(1)};
  
  // Line heights (scaled)
  static const double lineHeightTight = ${(1.25 * theme.lineHeightScale).toStringAsFixed(2)};
  static const double lineHeightNormal = ${baseLineHeight.toStringAsFixed(2)};
  static const double lineHeightRelaxed = ${(1.75 * theme.lineHeightScale).toStringAsFixed(2)};
  
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
    fontFamily: fontFamily,
    height: lineHeightTight,
  );
  
  static const TextStyle heading2 = TextStyle(
    fontSize: fontSize3XL,
    fontWeight: fontWeightBold,
    fontFamily: fontFamily,
    height: lineHeightTight,
  );
  
  static const TextStyle heading3 = TextStyle(
    fontSize: fontSize2XL,
    fontWeight: fontWeightSemiBold,
    fontFamily: fontFamily,
    height: lineHeightNormal,
  );
  
  static const TextStyle bodyLarge = TextStyle(
    fontSize: fontSizeLG,
    fontWeight: fontWeightNormal,
    fontFamily: fontFamily,
    height: lineHeightNormal,
  );
  
  static const TextStyle body = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeightNormal,
    fontFamily: fontFamily,
    height: lineHeightNormal,
  );
  
  static const TextStyle bodySmall = TextStyle(
    fontSize: fontSizeSM,
    fontWeight: fontWeightNormal,
    fontFamily: fontFamily,
    height: lineHeightNormal,
  );
  
  static const TextStyle caption = TextStyle(
    fontSize: fontSizeXS,
    fontWeight: fontWeightNormal,
    fontFamily: fontFamily,
    height: lineHeightNormal,
  );
}

/// Border radius constants for the UI library
class UIRadius {
  static const double none = 0.0;
  static const double sm = ${(4.0 * theme.radiusScale).toStringAsFixed(1)};
  static const double md = ${(8.0 * theme.radiusScale).toStringAsFixed(1)};
  static const double lg = ${(12.0 * theme.radiusScale).toStringAsFixed(1)};
  static const double xl = ${(16.0 * theme.radiusScale).toStringAsFixed(1)};
  static const double xxl = ${(24.0 * theme.radiusScale).toStringAsFixed(1)};
  static const double full = 9999.0;
}

/// Spacing constants for the UI library
class UISpacing {
  static const double xs = ${(4.0 * theme.spacingScale).toStringAsFixed(1)};
  static const double sm = ${(8.0 * theme.spacingScale).toStringAsFixed(1)};
  static const double md = ${(16.0 * theme.spacingScale).toStringAsFixed(1)};
  static const double lg = ${(24.0 * theme.spacingScale).toStringAsFixed(1)};
  static const double xl = ${(32.0 * theme.spacingScale).toStringAsFixed(1)};
  static const double xxl = ${(48.0 * theme.spacingScale).toStringAsFixed(1)};
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
    color: Color(0x${((0.05 * intensity * 255).round()).toRadixString(16).padLeft(2, '0')}000000),
    blurRadius: ${(2.0 * intensity).toStringAsFixed(1)},
    offset: Offset(0, 1),
  );

  static const BoxShadow md = BoxShadow(
    color: Color(0x${((0.1 * intensity * 255).round()).toRadixString(16).padLeft(2, '0')}000000),
    blurRadius: ${(4.0 * intensity).toStringAsFixed(1)},
    offset: Offset(0, 2),
  );

  static const BoxShadow lg = BoxShadow(
    color: Color(0x${((0.1 * intensity * 255).round()).toRadixString(16).padLeft(2, '0')}000000),
    blurRadius: ${(8.0 * intensity).toStringAsFixed(1)},
    offset: Offset(0, 4),
  );

  static const BoxShadow xl = BoxShadow(
    color: Color(0x${((0.15 * intensity * 255).round()).toRadixString(16).padLeft(2, '0')}000000),
    blurRadius: ${(16.0 * intensity).toStringAsFixed(1)},
    offset: Offset(0, 8),
  );
}

class UIEffects {
  UIEffects._();

  /// Apply glassmorphism decoration to a container
  static BoxDecoration glassDecoration({
    required Color baseColor,
    double blur = $glassBlur,
    double opacity = $glassOpacity,
    double radiusScale = 1.0,
    Color? borderColor,
  }) {
    return BoxDecoration(
      color: baseColor.withValues(alpha: opacity),
      borderRadius: BorderRadius.circular(12 * radiusScale),
      border: Border.all(
        color: (borderColor ?? Colors.white).withValues(alpha: 0.2),
        width: UIBorder.medium,
      ),
    );
  }

  /// Apply neumorphism decoration with soft shadows
  static BoxDecoration neumorphismDecoration({
    required Color baseColor,
    double intensity = $neumIntensity,
    double radiusScale = 1.0,
    bool isPressed = false,
  }) {
    final isDark = baseColor.computeLuminance() < 0.5;
    final lightColor = isDark
        ? Colors.white.withValues(alpha: 0.1 * intensity)
        : Colors.white.withValues(alpha: 0.7 * intensity);
    final darkColor = isDark
        ? Colors.black.withValues(alpha: 0.5 * intensity)
        : Colors.black.withValues(alpha: 0.15 * intensity);

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
    double angle = $gradientAngle,
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
    double intensity = $glowIntensity,
    double spread = $glowSpread,
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
    this.blur = $glassBlur,
    this.opacity = $glassOpacity,
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
              color: Colors.white.withValues(alpha: 0.3),
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
    this.intensity = $neumIntensity,
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
    this.angle = $gradientAngle,
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
    this.intensity = $glowIntensity,
    this.spread = $glowSpread,
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
''';
  }

  /// Generate colors.dart theme file (legacy - for backward compatibility)
  static String generateColorsFile(GlobalTheme theme) {
    return '''import 'package:flutter/material.dart';

/// UI Colors - Customizable color palette
class UIColors {
  // Primary colors
  static const Color primary = Color(0x${theme.primary.value.toRadixString(16).padLeft(8, '0').substring(2)});
  static const Color primaryForeground = Color(0x${theme.primaryForeground.value.toRadixString(16).padLeft(8, '0').substring(2)});
  
  // Secondary colors
  static const Color secondary = Color(0x${theme.secondary.value.toRadixString(16).padLeft(8, '0').substring(2)});
  static const Color secondaryForeground = Color(0x${theme.secondaryForeground.value.toRadixString(16).padLeft(8, '0').substring(2)});
  
  // Accent colors
  static const Color accent = Color(0x${theme.accent.value.toRadixString(16).padLeft(8, '0').substring(2)});
  static const Color accentForeground = Color(0x${theme.accentForeground.value.toRadixString(16).padLeft(8, '0').substring(2)});
  
  // Base colors
  static const Color background = Color(0x${theme.background.value.toRadixString(16).padLeft(8, '0').substring(2)});
  static const Color foreground = Color(0x${theme.foreground.value.toRadixString(16).padLeft(8, '0').substring(2)});
  
  // Card colors
  static const Color card = Color(0x${theme.card.value.toRadixString(16).padLeft(8, '0').substring(2)});
  static const Color cardForeground = Color(0x${theme.cardForeground.value.toRadixString(16).padLeft(8, '0').substring(2)});
  
  // Popover colors
  static const Color popover = Color(0x${theme.popover.value.toRadixString(16).padLeft(8, '0').substring(2)});
  static const Color popoverForeground = Color(0x${theme.popoverForeground.value.toRadixString(16).padLeft(8, '0').substring(2)});
  
  // Muted colors
  static const Color muted = Color(0x${theme.muted.value.toRadixString(16).padLeft(8, '0').substring(2)});
  static const Color mutedForeground = Color(0x${theme.mutedForeground.value.toRadixString(16).padLeft(8, '0').substring(2)});
  
  // Destructive colors
  static const Color destructive = Color(0x${theme.destructive.value.toRadixString(16).padLeft(8, '0').substring(2)});
  static const Color destructiveForeground = Color(0x${theme.destructiveForeground.value.toRadixString(16).padLeft(8, '0').substring(2)});
  
  // Border & Input
  static const Color border = Color(0x${theme.border.value.toRadixString(16).padLeft(8, '0').substring(2)});
  static const Color input = Color(0x${theme.input.value.toRadixString(16).padLeft(8, '0').substring(2)});
  static const Color ring = Color(0x${theme.ring.value.toRadixString(16).padLeft(8, '0').substring(2)});
  
  // Chart colors (for data visualization)
  static const Color chart1 = Color(0x${theme.chart1.value.toRadixString(16).padLeft(8, '0').substring(2)});
  static const Color chart2 = Color(0x${theme.chart2.value.toRadixString(16).padLeft(8, '0').substring(2)});
  static const Color chart3 = Color(0x${theme.chart3.value.toRadixString(16).padLeft(8, '0').substring(2)});
  static const Color chart4 = Color(0x${theme.chart4.value.toRadixString(16).padLeft(8, '0').substring(2)});
  static const Color chart5 = Color(0x${theme.chart5.value.toRadixString(16).padLeft(8, '0').substring(2)});
}
''';
  }

  /// Generate typography.dart theme file
  static String generateTypographyFile(GlobalTheme theme) {
    final baseFontSize = 16.0 * theme.fontSizeScale;
    final baseLineHeight = 1.5 * theme.lineHeightScale;

    return '''import 'package:flutter/material.dart';

/// UI Typography - Customizable typography system
class UITypography {
  // Font family
  static const String fontFamily = '${theme.fontFamily}';
  
  // Font sizes (scaled)
  static const double fontSizeXS = ${(12.0 * theme.fontSizeScale).toStringAsFixed(1)};
  static const double fontSizeSM = ${(14.0 * theme.fontSizeScale).toStringAsFixed(1)};
  static const double fontSizeBase = ${baseFontSize.toStringAsFixed(1)};
  static const double fontSizeLG = ${(18.0 * theme.fontSizeScale).toStringAsFixed(1)};
  static const double fontSizeXL = ${(20.0 * theme.fontSizeScale).toStringAsFixed(1)};
  static const double fontSize2XL = ${(24.0 * theme.fontSizeScale).toStringAsFixed(1)};
  static const double fontSize3XL = ${(30.0 * theme.fontSizeScale).toStringAsFixed(1)};
  static const double fontSize4XL = ${(36.0 * theme.fontSizeScale).toStringAsFixed(1)};
  
  // Line heights (scaled)
  static const double lineHeightTight = ${(1.25 * theme.lineHeightScale).toStringAsFixed(2)};
  static const double lineHeightNormal = ${baseLineHeight.toStringAsFixed(2)};
  static const double lineHeightRelaxed = ${(1.75 * theme.lineHeightScale).toStringAsFixed(2)};
  
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
    fontFamily: fontFamily,
    height: lineHeightTight,
  );
  
  static const TextStyle heading2 = TextStyle(
    fontSize: fontSize3XL,
    fontWeight: fontWeightBold,
    fontFamily: fontFamily,
    height: lineHeightTight,
  );
  
  static const TextStyle heading3 = TextStyle(
    fontSize: fontSize2XL,
    fontWeight: fontWeightSemiBold,
    fontFamily: fontFamily,
    height: lineHeightNormal,
  );
  
  static const TextStyle bodyLarge = TextStyle(
    fontSize: fontSizeLG,
    fontWeight: fontWeightNormal,
    fontFamily: fontFamily,
    height: lineHeightNormal,
  );
  
  static const TextStyle body = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeightNormal,
    fontFamily: fontFamily,
    height: lineHeightNormal,
  );
  
  static const TextStyle bodySmall = TextStyle(
    fontSize: fontSizeSM,
    fontWeight: fontWeightNormal,
    fontFamily: fontFamily,
    height: lineHeightNormal,
  );
  
  static const TextStyle caption = TextStyle(
    fontSize: fontSizeXS,
    fontWeight: fontWeightNormal,
    fontFamily: fontFamily,
    height: lineHeightNormal,
  );
}
''';
  }

  /// Generate radius.dart theme file
  static String generateRadiusFile(GlobalTheme theme) {
    return '''/// UI Radius - Customizable border radius values
class UIRadius {
  static const double none = 0.0;
  static const double sm = ${(2.0 * theme.radiusScale).toStringAsFixed(1)};
  static const double md = ${(4.0 * theme.radiusScale).toStringAsFixed(1)};
  static const double lg = ${(8.0 * theme.radiusScale).toStringAsFixed(1)};
  static const double xl = ${(12.0 * theme.radiusScale).toStringAsFixed(1)};
  static const double full = 9999.0;
}
''';
  }

  /// Generate spacing.dart theme file
  static String generateSpacingFile(GlobalTheme theme) {
    return '''/// UI Spacing - Customizable spacing values
class UISpacing {
  static const double xs = ${(4.0 * theme.spacingScale).toStringAsFixed(1)};
  static const double sm = ${(8.0 * theme.spacingScale).toStringAsFixed(1)};
  static const double md = ${(12.0 * theme.spacingScale).toStringAsFixed(1)};
  static const double lg = ${(16.0 * theme.spacingScale).toStringAsFixed(1)};
  static const double xl = ${(20.0 * theme.spacingScale).toStringAsFixed(1)};
  static const double xxl = ${(24.0 * theme.spacingScale).toStringAsFixed(1)};
  static const double xxxl = ${(32.0 * theme.spacingScale).toStringAsFixed(1)};
}
''';
  }

  /// Generate shadows.dart theme file
  static String generateShadowsFile(GlobalTheme theme) {
    final intensity = theme.shadowIntensity;
    return '''import 'package:flutter/material.dart';

/// UI Shadows - Customizable shadow values
class UIShadows {
  static List<BoxShadow> get sm => [
        BoxShadow(
          color: Colors.black.withOpacity(0.05 * $intensity),
          blurRadius: ${(2.0 * intensity).toStringAsFixed(1)},
          offset: const Offset(0, 1),
        ),
      ];
  
  static List<BoxShadow> get md => [
        BoxShadow(
          color: Colors.black.withOpacity(0.1 * $intensity),
          blurRadius: ${(4.0 * intensity).toStringAsFixed(1)},
          offset: const Offset(0, 2),
        ),
      ];
  
  static List<BoxShadow> get lg => [
        BoxShadow(
          color: Colors.black.withOpacity(0.1 * $intensity),
          blurRadius: ${(8.0 * intensity).toStringAsFixed(1)},
          offset: const Offset(0, 4),
        ),
      ];
  
  static List<BoxShadow> get xl => [
        BoxShadow(
          color: Colors.black.withOpacity(0.15 * $intensity),
          blurRadius: ${(16.0 * intensity).toStringAsFixed(1)},
          offset: const Offset(0, 8),
        ),
      ];
}
''';
  }

  /// Generate effects.dart theme file with visual effects utilities
  static String generateEffectsFile(GlobalTheme theme) {
    final glassBlur = theme.glassBlur;
    final glassOpacity = theme.glassOpacity;
    final neumIntensity = theme.neumorphismIntensity;
    final glowIntensity = theme.glowIntensity;
    final glowSpread = theme.glowSpread;
    final gradientAngle = theme.gradientAngle;

    String colorToHex(Color c) =>
        '0x${c.value.toRadixString(16).padLeft(8, '0').substring(2)}';

    return '''import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';

/// UI Effects - Visual effect utilities and decorations
class UIEffects {
  // Effect toggle states (set based on your design preferences)
  static const bool enableGlassmorphism = ${theme.enableGlassmorphism};
  static const bool enableNeumorphism = ${theme.enableNeumorphism};
  static const bool enableGradients = ${theme.enableGradients};
  static const bool enableBorderGlow = ${theme.enableBorderGlow};
  static const bool enableHoverAnimations = ${theme.enableHoverAnimations};

  // Glassmorphism settings
  static const double glassBlur = $glassBlur;
  static const double glassOpacity = $glassOpacity;

  // Neumorphism settings
  static const double neumorphismIntensity = $neumIntensity;

  // Gradient settings
  static const Color gradientStart = Color(${colorToHex(theme.gradientStart)});
  static const Color gradientEnd = Color(${colorToHex(theme.gradientEnd)});
  static const double gradientAngle = $gradientAngle;

  // Glow settings
  static const Color glowColor = Color(${colorToHex(theme.glowColor)});
  static const double glowIntensity = $glowIntensity;
  static const double glowSpread = $glowSpread;

  /// Get glassmorphism decoration
  static BoxDecoration glassDecoration({
    required Color baseColor,
    double radiusScale = 1.0,
    Color? borderColor,
  }) {
    if (!enableGlassmorphism) {
      return BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(12 * radiusScale),
      );
    }
    return BoxDecoration(
      color: baseColor.withOpacity(glassOpacity),
      borderRadius: BorderRadius.circular(12 * radiusScale),
      border: Border.all(
        color: (borderColor ?? Colors.white).withOpacity(0.2),
        width: 1.5,
      ),
    );
  }

  /// Get neumorphism decoration
  static BoxDecoration neumorphismDecoration({
    required Color baseColor,
    double radiusScale = 1.0,
    bool isPressed = false,
  }) {
    if (!enableNeumorphism) {
      return BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(12 * radiusScale),
      );
    }

    final isDark = baseColor.computeLuminance() < 0.5;
    final lightColor = isDark 
        ? Colors.white.withOpacity(0.1 * neumorphismIntensity)
        : Colors.white.withOpacity(0.7 * neumorphismIntensity);
    final darkColor = isDark
        ? Colors.black.withOpacity(0.5 * neumorphismIntensity)
        : Colors.black.withOpacity(0.15 * neumorphismIntensity);

    return BoxDecoration(
      color: baseColor,
      borderRadius: BorderRadius.circular(12 * radiusScale),
      boxShadow: [
        BoxShadow(
          color: darkColor,
          offset: Offset(4 * neumorphismIntensity, 4 * neumorphismIntensity),
          blurRadius: 8 * neumorphismIntensity,
        ),
        BoxShadow(
          color: lightColor,
          offset: Offset(-4 * neumorphismIntensity, -4 * neumorphismIntensity),
          blurRadius: 8 * neumorphismIntensity,
        ),
      ],
    );
  }

  /// Get gradient decoration
  static BoxDecoration gradientDecoration({double radiusScale = 1.0}) {
    if (!enableGradients) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(12 * radiusScale),
      );
    }

    final angleRad = gradientAngle * (math.pi / 180);
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment(-math.cos(angleRad), -math.sin(angleRad)),
        end: Alignment(math.cos(angleRad), math.sin(angleRad)),
        colors: [gradientStart, gradientEnd],
      ),
      borderRadius: BorderRadius.circular(12 * radiusScale),
    );
  }

  /// Get glow shadows
  static List<BoxShadow> get glowShadows {
    if (!enableBorderGlow) return [];
    return [
      BoxShadow(
        color: glowColor.withOpacity(glowIntensity),
        blurRadius: glowSpread * 2,
        spreadRadius: glowSpread / 2,
      ),
    ];
  }
}

/// Glass Container Widget
class GlassContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;

  const GlassContainer({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Theme.of(context).cardColor;
    final radius = borderRadius ?? BorderRadius.circular(12);

    if (!UIEffects.enableGlassmorphism) {
      return Container(
        padding: padding,
        decoration: BoxDecoration(color: bgColor, borderRadius: radius),
        child: child,
      );
    }

    return ClipRRect(
      borderRadius: radius,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: UIEffects.glassBlur,
          sigmaY: UIEffects.glassBlur,
        ),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: bgColor.withOpacity(UIEffects.glassOpacity),
            borderRadius: radius,
            border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.5),
          ),
          child: child,
        ),
      ),
    );
  }
}
''';
  }

  /// Get theme files - either consolidated (single theme.dart) or separate files
  ///
  /// Set [consolidated] to true to get a single theme.dart file (recommended)
  /// Set [consolidated] to false to get 6 separate theme files (legacy)
  static Map<String, String> generateThemeFiles(
    GlobalTheme theme, {
    bool consolidated = true,
  }) {
    if (consolidated) {
      return {'theme.dart': generateConsolidatedThemeFile(theme)};
    } else {
      return generateAllThemeFiles(theme);
    }
  }

  /// Get all theme files as a map (separate files - legacy)
  static Map<String, String> generateAllThemeFiles(GlobalTheme theme) {
    return {
      'colors.dart': generateColorsFile(theme),
      'typography.dart': generateTypographyFile(theme),
      'radius.dart': generateRadiusFile(theme),
      'spacing.dart': generateSpacingFile(theme),
      'shadows.dart': generateShadowsFile(theme),
      'effects.dart': generateEffectsFile(theme),
    };
  }

  /// Legacy method for backward compatibility (now returns colors.dart)
  @Deprecated('Use generateThemeFiles instead')
  static String generateThemeConfig(GlobalTheme theme) {
    return generateColorsFile(theme);
  }
}
