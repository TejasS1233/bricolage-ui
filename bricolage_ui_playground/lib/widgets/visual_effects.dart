import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../models/global_theme.dart';

/// Visual Effects - Helper widgets and decorations for applying visual effects
class VisualEffects {
  final GlobalTheme theme;

  VisualEffects(this.theme);

  /// Get glassmorphism decoration
  BoxDecoration get glassDecoration {
    if (!theme.enableGlassmorphism) {
      return const BoxDecoration();
    }
    return BoxDecoration(
      color: theme.card.withOpacity(theme.glassOpacity),
      borderRadius: BorderRadius.circular(12 * theme.radiusScale),
      border: Border.all(color: theme.border.withOpacity(0.2), width: 1.5),
    );
  }

  /// Get neumorphism decoration (light source from top-left)
  BoxDecoration getNeumorphismDecoration({bool isPressed = false}) {
    if (!theme.enableNeumorphism) {
      return BoxDecoration(
        color: theme.card,
        borderRadius: BorderRadius.circular(12 * theme.radiusScale),
      );
    }

    final intensity = theme.neumorphismIntensity;
    final isDark = theme.background.computeLuminance() < 0.5;

    final lightColor = isDark
        ? Colors.white.withOpacity(0.1 * intensity)
        : Colors.white.withOpacity(0.7 * intensity);
    final darkColor = isDark
        ? Colors.black.withOpacity(0.5 * intensity)
        : Colors.black.withOpacity(0.15 * intensity);

    if (isPressed) {
      return BoxDecoration(
        color: theme.card,
        borderRadius: BorderRadius.circular(12 * theme.radiusScale),
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
      color: theme.card,
      borderRadius: BorderRadius.circular(12 * theme.radiusScale),
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
  BoxDecoration get gradientDecoration {
    if (!theme.enableGradients) {
      return BoxDecoration(
        color: theme.card,
        borderRadius: BorderRadius.circular(12 * theme.radiusScale),
      );
    }

    final angleRad = theme.gradientAngle * (math.pi / 180);
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment(-math.cos(angleRad), -math.sin(angleRad)),
        end: Alignment(math.cos(angleRad), math.sin(angleRad)),
        colors: [theme.gradientStart, theme.gradientEnd],
      ),
      borderRadius: BorderRadius.circular(12 * theme.radiusScale),
    );
  }

  /// Get border glow shadows
  List<BoxShadow> get glowShadows {
    if (!theme.enableBorderGlow) {
      return [];
    }
    return [
      BoxShadow(
        color: theme.glowColor.withOpacity(theme.glowIntensity),
        blurRadius: theme.glowSpread * 2,
        spreadRadius: theme.glowSpread / 2,
      ),
    ];
  }

  /// Get hard shadow for neo-brutalism style
  List<BoxShadow> get hardShadow {
    if (!theme.enableHardShadow) {
      return [];
    }
    return [
      BoxShadow(
        color: theme.border,
        offset: Offset(theme.hardShadowOffsetX, theme.hardShadowOffsetY),
        blurRadius: 0, // No blur - hard shadow
      ),
    ];
  }

  /// Get combined decoration with all enabled effects
  BoxDecoration getCombinedDecoration({
    Color? backgroundColor,
    BorderRadius? borderRadius,
    bool isPressed = false,
  }) {
    final radius =
        borderRadius ?? BorderRadius.circular(12 * theme.radiusScale);
    final bgColor = backgroundColor ?? theme.card;

    List<BoxShadow> shadows = [];
    Gradient? gradient;
    Color? finalColor = bgColor;

    // Add neumorphism shadows
    if (theme.enableNeumorphism) {
      final neumDeco = getNeumorphismDecoration(isPressed: isPressed);
      shadows.addAll(neumDeco.boxShadow ?? []);
    }

    // Add glow shadows
    if (theme.enableBorderGlow) {
      shadows.addAll(glowShadows);
    }

    // Add hard shadow for neo-brutalism
    if (theme.enableHardShadow) {
      shadows.addAll(hardShadow);
    }

    // Gradients are now applied to app background only, not individual components
    // So we skip gradient application here

    // Apply glassmorphism (makes colors semi-transparent, but keeps gradient if set)
    if (theme.enableGlassmorphism && gradient == null) {
      finalColor = bgColor.withOpacity(theme.glassOpacity);
    }

    // Determine border based on effect
    Border? border;
    if (theme.enableHardShadow) {
      // Neo-brutalism: thick solid border
      border = Border.all(color: theme.border, width: theme.borderWidth);
    } else if (theme.enableGlassmorphism) {
      border = Border.all(color: theme.border.withOpacity(0.3), width: 1.5);
    } else if (theme.enableNeumorphism || theme.enableBorderGlow) {
      // Add subtle border for neumorphism and glow effects
      border = Border.all(color: theme.border.withOpacity(0.2), width: 1.0);
    }

    return BoxDecoration(
      color: gradient == null ? finalColor : null,
      gradient: gradient,
      borderRadius: radius,
      border: border,
      boxShadow: shadows.isEmpty ? null : shadows,
    );
  }
}

/// Glass Container - Applies glassmorphism effect
class GlassContainer extends StatelessWidget {
  final Widget child;
  final GlobalTheme theme;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  const GlassContainer({
    super.key,
    required this.child,
    required this.theme,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    if (!theme.enableGlassmorphism) {
      return Container(
        padding: padding,
        decoration: BoxDecoration(
          color: theme.card,
          borderRadius:
              borderRadius ?? BorderRadius.circular(12 * theme.radiusScale),
        ),
        child: child,
      );
    }

    final radius =
        borderRadius ?? BorderRadius.circular(12 * theme.radiusScale);

    return ClipRRect(
      borderRadius: radius,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: theme.glassBlur,
          sigmaY: theme.glassBlur,
        ),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: theme.card.withOpacity(theme.glassOpacity),
            borderRadius: radius,
            border: Border.all(
              color: theme.border.withOpacity(0.3),
              width: 1.5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

/// Effect Container - Applies all enabled effects
class EffectContainer extends StatefulWidget {
  final Widget child;
  final GlobalTheme theme;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  const EffectContainer({
    super.key,
    required this.child,
    required this.theme,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.onTap,
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
  late Animation<double> _shimmerAnimation;

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

    _shimmerAnimation = Tween<double>(
      begin: -1.0,
      end: 2.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    if (widget.theme.enableFloating == true ||
        widget.theme.enablePulse == true ||
        widget.theme.enableShimmer == true) {
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
    if (widget.theme.enableFloating == true ||
        widget.theme.enablePulse == true ||
        widget.theme.enableShimmer == true) {
      if (!_controller.isAnimating) {
        _controller.repeat(reverse: true);
      }
    } else {
      _controller.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final effects = VisualEffects(widget.theme);
    final radius =
        widget.borderRadius ??
        BorderRadius.circular(12 * widget.theme.radiusScale);

    Widget container;

    // Build base container content
    Widget buildBaseContainer() {
      // If glassmorphism is enabled, use blur effect
      if (widget.theme.enableGlassmorphism) {
        return ClipRRect(
          borderRadius: radius,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: widget.theme.glassBlur,
              sigmaY: widget.theme.glassBlur,
            ),
            child: AnimatedContainer(
              duration: widget.theme.enableHoverAnimations
                  ? const Duration(milliseconds: 200)
                  : Duration.zero,
              transform: widget.theme.enableHoverAnimations && _isHovered
                  ? (Matrix4.identity()..scale(1.02))
                  : Matrix4.identity(),
              padding: widget.padding,
              decoration: effects
                  .getCombinedDecoration(
                    backgroundColor:
                        widget.backgroundColor ?? widget.theme.card,
                    borderRadius: radius,
                    isPressed: _isPressed,
                  )
                  .copyWith(
                    // Use semi-transparent background for glass effect but keep content visible
                    color: Colors.white.withOpacity(widget.theme.glassOpacity),
                    backgroundBlendMode: BlendMode.lighten,
                  ),
              child: widget.child,
            ),
          ),
        );
      } else {
        return AnimatedContainer(
          duration: widget.theme.enableHoverAnimations
              ? const Duration(milliseconds: 200)
              : Duration.zero,
          transform: widget.theme.enableHoverAnimations && _isHovered
              ? (Matrix4.identity()..scale(1.02))
              : Matrix4.identity(),
          padding: widget.padding,
          decoration: effects.getCombinedDecoration(
            backgroundColor: widget.backgroundColor,
            borderRadius: radius,
            isPressed: _isPressed,
          ),
          child: widget.child,
        );
      }
    }

    container = buildBaseContainer();

    // Apply shimmer effect as an overlay (doesn't hide content)
    if (widget.theme.enableShimmer == true) {
      container = Stack(
        children: [
          container,
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _shimmerAnimation,
              builder: (context, child) {
                return ClipRRect(
                  borderRadius: radius,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.transparent,
                          Colors.white.withOpacity(0.1),
                          Colors.transparent,
                        ],
                        stops: [
                          _shimmerAnimation.value - 0.3,
                          _shimmerAnimation.value,
                          _shimmerAnimation.value + 0.3,
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    }

    // Apply pulse effect
    if (widget.theme.enablePulse == true) {
      container = AnimatedBuilder(
        animation: _pulseAnimation,
        builder: (context, child) {
          return Transform.scale(scale: _pulseAnimation.value, child: child);
        },
        child: container,
      );
    }

    // Apply floating effect
    if (widget.theme.enableFloating == true) {
      container = AnimatedBuilder(
        animation: _floatingAnimation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(
              0,
              math.sin(_floatingAnimation.value * math.pi * 2) *
                  (widget.theme.floatingDistance ?? 10.0),
            ),
            child: child,
          );
        },
        child: container,
      );
    }

    // Apply tilt hover effect
    if (widget.theme.enableTiltHover == true && _isHovered) {
      container = Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(widget.theme.tiltIntensity ?? 0.05)
          ..rotateY(widget.theme.tiltIntensity ?? 0.05),
        alignment: Alignment.center,
        child: container,
      );
    }

    if (widget.onTap != null ||
        widget.theme.enableHoverAnimations ||
        widget.theme.enableTiltHover == true) {
      return MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTapDown: (_) => setState(() => _isPressed = true),
          onTapUp: (_) {
            setState(() => _isPressed = false);
            widget.onTap?.call();
          },
          onTapCancel: () => setState(() => _isPressed = false),
          child: container,
        ),
      );
    }

    return container;
  }
}
