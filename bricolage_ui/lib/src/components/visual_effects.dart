import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/theme.dart';

/// Visual Effects - Helper class for applying visual effects using theme properties
class VisualEffects {
  /// Get glassmorphism decoration
  static BoxDecoration glassDecoration({
    required bool enabled,
    required Color cardColor,
    required Color borderColor,
    required double opacity,
    required double blur,
    required double radiusScale,
  }) {
    if (!enabled) {
      return const BoxDecoration();
    }
    return BoxDecoration(
      color: cardColor.withValues(alpha: opacity),
      borderRadius: BorderRadius.circular(12 * radiusScale),
      border: Border.all(color: borderColor.withValues(alpha: 0.2), width: 1.5),
    );
  }

  /// Get neumorphism decoration (light source from top-left)
  static BoxDecoration neumorphismDecoration({
    required bool enabled,
    required Color cardColor,
    required Color backgroundColor,
    required double intensity,
    required double radiusScale,
    bool isPressed = false,
  }) {
    if (!enabled) {
      return BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12 * radiusScale),
      );
    }

    final isDark = backgroundColor.computeLuminance() < 0.5;

    final lightColor = isDark
        ? Colors.white.withValues(alpha: 0.1 * intensity)
        : Colors.white.withValues(alpha: 0.7 * intensity);
    final darkColor = isDark
        ? Colors.black.withValues(alpha: 0.5 * intensity)
        : Colors.black.withValues(alpha: 0.15 * intensity);

    if (isPressed) {
      return BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12 * radiusScale),
        boxShadow: [
          BoxShadow(
            color: darkColor,
            offset: const Offset(2, 2),
            blurRadius: 4,
          ),
          BoxShadow(
            color: lightColor,
            offset: const Offset(-2, -2),
            blurRadius: 4,
          ),
        ],
      );
    }

    return BoxDecoration(
      color: cardColor,
      borderRadius: BorderRadius.circular(12 * radiusScale),
      boxShadow: [
        BoxShadow(
          color: darkColor,
          offset: Offset(4 * intensity, 4 * intensity),
          blurRadius: 8 * intensity,
        ),
        BoxShadow(
          color: lightColor,
          offset: Offset(-4 * intensity, -4 * intensity),
          blurRadius: 8 * intensity,
        ),
      ],
    );
  }

  /// Get gradient decoration
  static BoxDecoration gradientDecoration({
    required bool enabled,
    required Color gradientStart,
    required Color gradientEnd,
    required double angle,
    required double radiusScale,
    Color? fallbackColor,
  }) {
    if (!enabled) {
      return BoxDecoration(
        color: fallbackColor,
        borderRadius: BorderRadius.circular(12 * radiusScale),
      );
    }

    final angleRad = angle * (math.pi / 180);
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment(-math.cos(angleRad), -math.sin(angleRad)),
        end: Alignment(math.cos(angleRad), math.sin(angleRad)),
        colors: [gradientStart, gradientEnd],
      ),
      borderRadius: BorderRadius.circular(12 * radiusScale),
    );
  }

  /// Get border glow shadows
  static List<BoxShadow> glowShadows({
    required bool enabled,
    required Color glowColor,
    required double intensity,
    required double spread,
  }) {
    if (!enabled) {
      return [];
    }
    return [
      BoxShadow(
        color: glowColor.withValues(alpha: intensity),
        blurRadius: spread * 2,
        spreadRadius: spread / 2,
      ),
    ];
  }

  /// Get hard shadow for neo-brutalism style
  static List<BoxShadow> hardShadow({
    required bool enabled,
    required Color shadowColor,
    required double offsetX,
    required double offsetY,
  }) {
    if (!enabled) {
      return [];
    }
    return [
      BoxShadow(
        color: shadowColor,
        offset: Offset(offsetX, offsetY),
        blurRadius: 0, // No blur - hard shadow
      ),
    ];
  }
}

/// Glass Container - Applies glassmorphism effect
class GlassContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  const GlassContainer({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.circular(12);

    return ClipRRect(
      borderRadius: radius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: UIColors.background.withValues(alpha: 0.2),
            borderRadius: radius,
            border: Border.all(
              color: UIColors.border.withValues(alpha: 0.3),
              width: 1.5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

/// Effect Container - Applies visual effects based on enabled flags
class EffectContainer extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  // Effect flags
  final bool enableGlassmorphism;
  final double glassBlur;
  final double glassOpacity;

  final bool enableNeumorphism;
  final double neumorphismIntensity;

  final bool enableGradients;
  final Color gradientStart;
  final Color gradientEnd;
  final double gradientAngle;

  final bool enableBorderGlow;
  final Color glowColor;
  final double glowIntensity;
  final double glowSpread;

  final bool enableHardShadow;
  final double hardShadowOffsetX;
  final double hardShadowOffsetY;

  final bool enablePulse;
  final bool enableFloating;
  final double floatingDistance;
  final bool enableTiltHover;
  final double tiltIntensity;

  final bool enableHoverAnimations;

  const EffectContainer({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.onTap,
    this.enableGlassmorphism = false,
    this.glassBlur = 10.0,
    this.glassOpacity = 0.2,
    this.enableNeumorphism = false,
    this.neumorphismIntensity = 0.5,
    this.enableGradients = false,
    this.gradientStart = const Color(0xFF6366F1),
    this.gradientEnd = const Color(0xFF8B5CF6),
    this.gradientAngle = 135.0,
    this.enableBorderGlow = false,
    this.glowColor = const Color(0xFF6366F1),
    this.glowIntensity = 0.5,
    this.glowSpread = 4.0,
    this.enableHardShadow = false,
    this.hardShadowOffsetX = 4.0,
    this.hardShadowOffsetY = 4.0,
    this.enablePulse = false,
    this.enableFloating = false,
    this.floatingDistance = 10.0,
    this.enableTiltHover = false,
    this.tiltIntensity = 0.05,
    this.enableHoverAnimations = false,
  });

  @override
  State<EffectContainer> createState() => _EffectContainerState();
}

class _EffectContainerState extends State<EffectContainer>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _floatingAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _floatingAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    if (widget.enableFloating || widget.enablePulse) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(EffectContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.enableFloating || widget.enablePulse) {
      if (!_controller.isAnimating) {
        _controller.repeat(reverse: true);
      }
    } else {
      _controller.stop();
    }
  }

  BoxDecoration _getCombinedDecoration({
    required BorderRadius radius,
    required Color bgColor,
  }) {
    List<BoxShadow> shadows = [];
    Gradient? gradient;
    Color? finalColor = bgColor;

    // Add neumorphism shadows
    if (widget.enableNeumorphism) {
      final neumDeco = VisualEffects.neumorphismDecoration(
        enabled: true,
        cardColor: bgColor,
        backgroundColor: UIColors.background,
        intensity: widget.neumorphismIntensity,
        radiusScale: 1.0,
        isPressed: _isPressed,
      );
      shadows.addAll(neumDeco.boxShadow ?? []);
    }

    // Add glow shadows
    if (widget.enableBorderGlow) {
      shadows.addAll(VisualEffects.glowShadows(
        enabled: true,
        glowColor: widget.glowColor,
        intensity: widget.glowIntensity,
        spread: widget.glowSpread,
      ));
    }

    // Add hard shadow for neo-brutalism
    if (widget.enableHardShadow) {
      shadows.addAll(VisualEffects.hardShadow(
        enabled: true,
        shadowColor: UIColors.border,
        offsetX: widget.hardShadowOffsetX,
        offsetY: widget.hardShadowOffsetY,
      ));
    }

    // Apply gradient
    if (widget.enableGradients) {
      gradient = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [widget.gradientStart, widget.gradientEnd],
      );
      finalColor = null;
    }

    // Apply glassmorphism
    if (widget.enableGlassmorphism && gradient == null) {
      finalColor = Colors.white.withValues(alpha: widget.glassOpacity);
    }

    // Determine border
    Border? border;
    if (widget.enableHardShadow) {
      border = Border.all(color: UIColors.border, width: 1.0);
    } else if (widget.enableGlassmorphism) {
      border =
          Border.all(color: UIColors.border.withValues(alpha: 0.3), width: 1.5);
    } else if (widget.enableNeumorphism || widget.enableBorderGlow) {
      border =
          Border.all(color: UIColors.border.withValues(alpha: 0.2), width: 1.0);
    }

    return BoxDecoration(
      color: gradient == null ? finalColor : null,
      gradient: gradient,
      borderRadius: radius,
      border: border,
      boxShadow: shadows.isEmpty ? null : shadows,
    );
  }

  @override
  Widget build(BuildContext context) {
    final radius = widget.borderRadius ?? BorderRadius.circular(12);
    final bgColor = widget.backgroundColor ?? UIColors.background;

    Widget container;

    // Build base container
    if (widget.enableGlassmorphism) {
      container = ClipRRect(
        borderRadius: radius,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: widget.glassBlur,
            sigmaY: widget.glassBlur,
          ),
          child: AnimatedContainer(
            duration: widget.enableHoverAnimations
                ? const Duration(milliseconds: 200)
                : Duration.zero,
            transform: widget.enableHoverAnimations && _isHovered
                ? Matrix4.diagonal3Values(1.02, 1.02, 1.0)
                : Matrix4.identity(),
            padding: widget.padding,
            decoration:
                _getCombinedDecoration(radius: radius, bgColor: bgColor),
            child: widget.child,
          ),
        ),
      );
    } else {
      container = AnimatedContainer(
        duration: widget.enableHoverAnimations
            ? const Duration(milliseconds: 200)
            : Duration.zero,
        transform: widget.enableHoverAnimations && _isHovered
            ? Matrix4.diagonal3Values(1.02, 1.02, 1.0)
            : Matrix4.identity(),
        padding: widget.padding,
        decoration: _getCombinedDecoration(radius: radius, bgColor: bgColor),
        child: widget.child,
      );
    }

    // Apply pulse effect
    if (widget.enablePulse) {
      container = AnimatedBuilder(
        animation: _pulseAnimation,
        builder: (context, child) {
          return Transform.scale(scale: _pulseAnimation.value, child: child);
        },
        child: container,
      );
    }

    // Apply floating effect
    if (widget.enableFloating) {
      container = AnimatedBuilder(
        animation: _floatingAnimation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(
              0,
              math.sin(_floatingAnimation.value * math.pi * 2) *
                  widget.floatingDistance,
            ),
            child: child,
          );
        },
        child: container,
      );
    }

    // Apply tilt hover effect
    if (widget.enableTiltHover && _isHovered) {
      container = Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(widget.tiltIntensity)
          ..rotateY(widget.tiltIntensity),
        alignment: Alignment.center,
        child: container,
      );
    }

    if (widget.onTap != null ||
        widget.enableHoverAnimations ||
        widget.enableTiltHover) {
      return RepaintBoundary(
        child: MouseRegion(
          cursor: widget.onTap != null
              ? SystemMouseCursors.click
              : SystemMouseCursors.basic,
          opaque: true,
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTapDown: (_) => setState(() => _isPressed = true),
            onTapUp: (_) {
              setState(() => _isPressed = false);
              widget.onTap?.call();
            },
            onTapCancel: () => setState(() => _isPressed = false),
            child: container,
          ),
        ),
      );
    }

    return container;
  }
}
