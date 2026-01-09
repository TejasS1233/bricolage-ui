import 'package:flutter/material.dart';

class GlobalTheme {
  // Primary Colors
  Color primary;
  Color primaryForeground;

  // Secondary Colors
  Color secondary;
  Color secondaryForeground;

  // Accent Colors
  Color accent;
  Color accentForeground;

  // Base Colors
  Color background;
  Color foreground;

  // Card Colors
  Color card;
  Color cardForeground;

  // Popover Colors
  Color popover;
  Color popoverForeground;

  // Muted Colors
  Color muted;
  Color mutedForeground;

  // Destructive Colors
  Color destructive;
  Color destructiveForeground;

  // Border & Input
  Color border;
  Color input;
  Color ring;

  // Chart Colors (for data visualization)
  Color chart1;
  Color chart2;
  Color chart3;
  Color chart4;
  Color chart5;

  // Scales
  double radiusScale;
  double spacingScale;
  double shadowIntensity;

  // Typography
  double fontSizeScale;
  double lineHeightScale;
  String fontFamily;

  // Visual Effects
  bool enableGlassmorphism;
  double glassBlur;
  double glassOpacity;

  bool enableNeumorphism;
  double neumorphismIntensity;

  bool enableGradients;
  Color gradientStart;
  Color gradientEnd;
  double gradientAngle;

  bool enableBorderGlow;
  Color glowColor;
  double glowIntensity;
  double glowSpread;

  bool enableHoverAnimations;

  // Additional Visual Effects
  bool? enableShimmer;
  Color? shimmerBaseColor;
  Color? shimmerHighlightColor;
  double? shimmerSpeed;

  bool? enablePulse;
  double? pulseSpeed;
  double? pulseScale;

  bool? enableFloating;
  double? floatingDistance;
  double? floatingSpeed;

  bool? enableTiltHover;
  double? tiltIntensity;

  bool? enableAnimatedGradient;
  double? gradientAnimationSpeed;

  // Neo-Brutalism style
  double borderWidth;
  bool enableHardShadow;
  double hardShadowOffsetX;
  double hardShadowOffsetY;

  GlobalTheme({
    // Primary
    this.primary = const Color(0xFF09090B),
    this.primaryForeground = const Color(0xFFFAFAFA),

    // Secondary
    this.secondary = const Color(0xFFF4F4F5),
    this.secondaryForeground = const Color(0xFF18181B),

    // Accent
    this.accent = const Color(0xFFF4F4F5),
    this.accentForeground = const Color(0xFF18181B),

    // Base
    this.background = const Color(0xFFFFFFFF),
    this.foreground = const Color(0xFF09090B),

    // Card
    this.card = const Color(0xFFFFFFFF),
    this.cardForeground = const Color(0xFF09090B),

    // Popover
    this.popover = const Color(0xFFFFFFFF),
    this.popoverForeground = const Color(0xFF09090B),

    // Muted
    this.muted = const Color(0xFFF4F4F5),
    this.mutedForeground = const Color(0xFF71717A),

    // Destructive
    this.destructive = const Color(0xFFEF4444),
    this.destructiveForeground = const Color(0xFFFAFAFA),

    // Border & Input
    this.border = const Color(0xFFE4E4E7),
    this.input = const Color(0xFFE4E4E7),
    this.ring = const Color(0xFF09090B),

    // Chart
    this.chart1 = const Color(0xFF6366F1),
    this.chart2 = const Color(0xFF8B5CF6),
    this.chart3 = const Color(0xFFEC4899),
    this.chart4 = const Color(0xFFF59E0B),
    this.chart5 = const Color(0xFF10B981),

    // Scales
    this.radiusScale = 1.0,
    this.spacingScale = 1.0,
    this.shadowIntensity = 1.0,

    // Typography
    this.fontSizeScale = 1.0,
    this.lineHeightScale = 1.0,
    this.fontFamily = 'Inter',

    // Visual Effects
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

    this.enableHoverAnimations = false,

    // Additional Visual Effects
    this.enableShimmer,
    this.shimmerBaseColor,
    this.shimmerHighlightColor,
    this.shimmerSpeed,

    this.enablePulse,
    this.pulseSpeed,
    this.pulseScale,

    this.enableFloating,
    this.floatingDistance,
    this.floatingSpeed,

    this.enableTiltHover,
    this.tiltIntensity,

    this.enableAnimatedGradient,
    this.gradientAnimationSpeed,

    // Neo-Brutalism defaults
    this.borderWidth = 1.0,
    this.enableHardShadow = false,
    this.hardShadowOffsetX = 4.0,
    this.hardShadowOffsetY = 4.0,
  });

  GlobalTheme copyWith({
    Color? primary,
    Color? primaryForeground,
    Color? secondary,
    Color? secondaryForeground,
    Color? accent,
    Color? accentForeground,
    Color? background,
    Color? foreground,
    Color? card,
    Color? cardForeground,
    Color? popover,
    Color? popoverForeground,
    Color? muted,
    Color? mutedForeground,
    Color? destructive,
    Color? destructiveForeground,
    Color? border,
    Color? input,
    Color? ring,
    Color? chart1,
    Color? chart2,
    Color? chart3,
    Color? chart4,
    Color? chart5,
    double? radiusScale,
    double? spacingScale,
    double? shadowIntensity,
    double? fontSizeScale,
    double? lineHeightScale,
    String? fontFamily,
    // Visual Effects
    bool? enableGlassmorphism,
    double? glassBlur,
    double? glassOpacity,
    bool? enableNeumorphism,
    double? neumorphismIntensity,
    bool? enableGradients,
    Color? gradientStart,
    Color? gradientEnd,
    double? gradientAngle,
    bool? enableBorderGlow,
    Color? glowColor,
    double? glowIntensity,
    double? glowSpread,
    bool? enableHoverAnimations,
    // Additional Visual Effects
    bool? enableShimmer,
    Color? shimmerBaseColor,
    Color? shimmerHighlightColor,
    double? shimmerSpeed,
    bool? enablePulse,
    double? pulseSpeed,
    double? pulseScale,
    bool? enableFloating,
    double? floatingDistance,
    double? floatingSpeed,
    bool? enableTiltHover,
    double? tiltIntensity,
    bool? enableAnimatedGradient,
    double? gradientAnimationSpeed,
    // Neo-Brutalism
    double? borderWidth,
    bool? enableHardShadow,
    double? hardShadowOffsetX,
    double? hardShadowOffsetY,
  }) {
    return GlobalTheme(
      primary: primary ?? this.primary,
      primaryForeground: primaryForeground ?? this.primaryForeground,
      secondary: secondary ?? this.secondary,
      secondaryForeground: secondaryForeground ?? this.secondaryForeground,
      accent: accent ?? this.accent,
      accentForeground: accentForeground ?? this.accentForeground,
      background: background ?? this.background,
      foreground: foreground ?? this.foreground,
      card: card ?? this.card,
      cardForeground: cardForeground ?? this.cardForeground,
      popover: popover ?? this.popover,
      popoverForeground: popoverForeground ?? this.popoverForeground,
      muted: muted ?? this.muted,
      mutedForeground: mutedForeground ?? this.mutedForeground,
      destructive: destructive ?? this.destructive,
      destructiveForeground:
          destructiveForeground ?? this.destructiveForeground,
      border: border ?? this.border,
      input: input ?? this.input,
      ring: ring ?? this.ring,
      chart1: chart1 ?? this.chart1,
      chart2: chart2 ?? this.chart2,
      chart3: chart3 ?? this.chart3,
      chart4: chart4 ?? this.chart4,
      chart5: chart5 ?? this.chart5,
      radiusScale: radiusScale ?? this.radiusScale,
      spacingScale: spacingScale ?? this.spacingScale,
      shadowIntensity: shadowIntensity ?? this.shadowIntensity,
      fontSizeScale: fontSizeScale ?? this.fontSizeScale,
      lineHeightScale: lineHeightScale ?? this.lineHeightScale,
      fontFamily: fontFamily ?? this.fontFamily,
      // Visual Effects
      enableGlassmorphism: enableGlassmorphism ?? this.enableGlassmorphism,
      glassBlur: glassBlur ?? this.glassBlur,
      glassOpacity: glassOpacity ?? this.glassOpacity,
      enableNeumorphism: enableNeumorphism ?? this.enableNeumorphism,
      neumorphismIntensity: neumorphismIntensity ?? this.neumorphismIntensity,
      enableGradients: enableGradients ?? this.enableGradients,
      gradientStart: gradientStart ?? this.gradientStart,
      gradientEnd: gradientEnd ?? this.gradientEnd,
      gradientAngle: gradientAngle ?? this.gradientAngle,
      enableBorderGlow: enableBorderGlow ?? this.enableBorderGlow,
      glowColor: glowColor ?? this.glowColor,
      glowIntensity: glowIntensity ?? this.glowIntensity,
      glowSpread: glowSpread ?? this.glowSpread,
      enableHoverAnimations:
          enableHoverAnimations ?? this.enableHoverAnimations,
      // Additional Visual Effects
      enableShimmer: enableShimmer ?? this.enableShimmer,
      shimmerBaseColor: shimmerBaseColor ?? this.shimmerBaseColor,
      shimmerHighlightColor:
          shimmerHighlightColor ?? this.shimmerHighlightColor,
      shimmerSpeed: shimmerSpeed ?? this.shimmerSpeed,
      enablePulse: enablePulse ?? this.enablePulse,
      pulseSpeed: pulseSpeed ?? this.pulseSpeed,
      pulseScale: pulseScale ?? this.pulseScale,
      enableFloating: enableFloating ?? this.enableFloating,
      floatingDistance: floatingDistance ?? this.floatingDistance,
      floatingSpeed: floatingSpeed ?? this.floatingSpeed,
      enableTiltHover: enableTiltHover ?? this.enableTiltHover,
      tiltIntensity: tiltIntensity ?? this.tiltIntensity,
      enableAnimatedGradient:
          enableAnimatedGradient ?? this.enableAnimatedGradient,
      gradientAnimationSpeed:
          gradientAnimationSpeed ?? this.gradientAnimationSpeed,
      // Neo-Brutalism
      borderWidth: borderWidth ?? this.borderWidth,
      enableHardShadow: enableHardShadow ?? this.enableHardShadow,
      hardShadowOffsetX: hardShadowOffsetX ?? this.hardShadowOffsetX,
      hardShadowOffsetY: hardShadowOffsetY ?? this.hardShadowOffsetY,
    );
  }

  /// Bubblegum theme - playful pink/teal with rounded neo-brutalism
  /// Based on TweakCN style: --radius: 0.4rem, --shadow: 3px 3px
  static GlobalTheme bubblegum() {
    return GlobalTheme(
      primary: const Color(0xFFD4578C), // Pink/magenta
      primaryForeground: const Color(0xFFFFFFFF),
      secondary: const Color(0xFF8FD4D2), // Teal
      secondaryForeground: const Color(0xFF333333),
      background: const Color(0xFFF5E6EB), // Pinkish white
      foreground: const Color(0xFF4A4A4A),
      card: const Color(0xFFF7EED1), // Cream/yellow tint
      cardForeground: const Color(0xFF4A4A4A),
      muted: const Color(0xFFE6D8DC),
      mutedForeground: const Color(0xFF777777),
      popover: const Color(0xFFFFFFFF),
      popoverForeground: const Color(0xFF4A4A4A),
      border: const Color(0xFFD4578C), // Pink border
      input: const Color(0xFFEEEEEE),
      ring: const Color(0xFFE07AA3),
      destructive: const Color(0xFFE07474),
      destructiveForeground: const Color(0xFFFFFFFF),
      accent: const Color(0xFFF2DB80), // Yellow accent
      accentForeground: const Color(0xFF333333),
      chart1: const Color(0xFFE07AA3),
      chart2: const Color(0xFF8FD4D2),
      chart3: const Color(0xFFF2DB80),
      chart4: const Color(0xFFD4A0B8),
      chart5: const Color(0xFF7AA3E0),
      radiusScale: 0.8,
      spacingScale: 1.0,
      shadowIntensity: 1.0,
      fontFamily: 'Poppins',
      borderWidth: 2.0,
      enableHardShadow: true,
      hardShadowOffsetX: 3.0,
      hardShadowOffsetY: 3.0,
    );
  }

  /// Vintage theme - warm tan/brown colors, serif fonts, soft shadows
  static GlobalTheme vintage() {
    return GlobalTheme(
      primary: const Color(0xFF8B7355), // Warm brown
      primaryForeground: const Color(0xFFFFFFFF),
      secondary: const Color(0xFFD9CFC2), // Warm tan
      secondaryForeground: const Color(0xFF5C5044),
      background: const Color(0xFFF5EFE6), // Cream background
      foreground: const Color(0xFF4A4137),
      card: const Color(0xFFFDF9F3),
      cardForeground: const Color(0xFF4A4137),
      muted: const Color(0xFFE8E0D5),
      mutedForeground: const Color(0xFF7A7164),
      popover: const Color(0xFFFDF9F3),
      popoverForeground: const Color(0xFF4A4137),
      border: const Color(0xFFD0C6B8),
      input: const Color(0xFFD0C6B8),
      ring: const Color(0xFF8B7355),
      destructive: const Color(0xFF9E5A5A),
      destructiveForeground: const Color(0xFFFFFFFF),
      accent: const Color(0xFFCBBFA8),
      accentForeground: const Color(0xFF4A4137),
      chart1: const Color(0xFF8B7355),
      chart2: const Color(0xFF7A6A58),
      chart3: const Color(0xFF6B5C4C),
      chart4: const Color(0xFF9C8A74),
      chart5: const Color(0xFFAD9A82),
      radiusScale: 0.5,
      spacingScale: 1.0,
      shadowIntensity: 0.12,
      fontFamily: 'Libre Baskerville',
    );
  }

  /// Amethyst theme - purple/teal with extra rounded corners
  /// Clean, modern look with generous radius
  static GlobalTheme amethyst() {
    return GlobalTheme(
      primary: const Color(0xFF9B5DE5), // Purple-600
      primaryForeground: const Color(0xFFFFFFFF),
      secondary: const Color(0xFF7CD4CC), // Teal-400
      secondaryForeground: const Color(0xFF000000),
      background: const Color(0xFFF8F7FC), // Very light purple
      foreground: const Color(0xFF3D3854), // Dark purple-gray
      card: const Color(0xFFFFFFFF),
      cardForeground: const Color(0xFF3D3854),
      muted: const Color(0xFFF0EFF6),
      mutedForeground: const Color(0xFF6B6580),
      popover: const Color(0xFFFFFFFF),
      popoverForeground: const Color(0xFF3D3854),
      border: const Color(0xFFE5E3ED),
      input: const Color(0xFFDAD7E6),
      ring: const Color(0xFF9B5DE5),
      destructive: const Color(0xFFE53E3E),
      destructiveForeground: const Color(0xFFFFFFFF),
      accent: const Color(0xFFF0EFF6),
      accentForeground: const Color(0xFF3D3854),
      chart1: const Color(0xFF9B5DE5),
      chart2: const Color(0xFF7CD4CC),
      chart3: const Color(0xFFB794F4),
      chart4: const Color(0xFFA8DCD6),
      chart5: const Color(0xFFD4BBF9),
      radiusScale: 2.0, // Very rounded (1rem)
      spacingScale: 1.0,
      shadowIntensity: 0.1,
      fontFamily: 'DynaPuff',
    );
  }

  /// Spring theme - fresh green/pink with medium rounded corners
  static GlobalTheme spring() {
    return GlobalTheme(
      primary: const Color(0xFF4D9E6B), // Green-700
      primaryForeground: const Color(0xFFFFFFFF),
      secondary: const Color(0xFF9E6B7B), // Pink-600
      secondaryForeground: const Color(0xFFFFFFFF),
      background: const Color(0xFFFAFAFA), // Near white
      foreground: const Color(0xFF3D4D45),
      card: const Color(0xFFFFFFFF),
      cardForeground: const Color(0xFF3D4D45),
      muted: const Color(0xFFF3F4F3),
      mutedForeground: const Color(0xFF6B7770),
      popover: const Color(0xFFFFFFFF),
      popoverForeground: const Color(0xFF3D4D45),
      border: const Color(0xFFE5E7E6),
      input: const Color(0xFFDBDEDC),
      ring: const Color(0xFF4D9E6B),
      destructive: const Color(0xFFE53E3E),
      destructiveForeground: const Color(0xFFFFFFFF),
      accent: const Color(0xFFF3F4F3),
      accentForeground: const Color(0xFF3D4D45),
      chart1: const Color(0xFF4D9E6B),
      chart2: const Color(0xFF9E6B7B),
      chart3: const Color(0xFF7BC98F),
      chart4: const Color(0xFFC99AAC),
      chart5: const Color(0xFFA5D6B5),
      radiusScale: 1.0, // Medium rounded (0.5rem)
      spacingScale: 1.0,
      shadowIntensity: 0.1,
      fontFamily: 'Inter',
    );
  }

  /// Cyberpunk theme - dark mode with neon accents (dev aesthetic)
  static GlobalTheme cyberpunk() {
    return GlobalTheme(
      primary: const Color(0xFF00FF41), // Matrix/neon green
      primaryForeground: const Color(0xFF000000),
      secondary: const Color(0xFFFF00FF), // Neon pink/magenta
      secondaryForeground: const Color(0xFF000000),
      background: const Color(0xFF0D0D0D), // Near black
      foreground: const Color(0xFF00FF41), // Neon green text
      card: const Color(0xFF1A1A2E), // Dark purple-black
      cardForeground: const Color(0xFFE0E0E0),
      muted: const Color(0xFF16213E), // Dark blue
      mutedForeground: const Color(0xFF8B8B8B),
      border: const Color(0xFF00FF41).withOpacity(0.3), // Neon border
      input: const Color(0xFF1A1A2E),
      ring: const Color(0xFF00FF41),
      destructive: const Color(0xFFFF0055), // Neon red
      destructiveForeground: const Color(0xFFFFFFFF),
      accent: const Color(0xFF00D4FF), // Cyan accent
      accentForeground: const Color(0xFF000000),
      chart1: const Color(0xFF00FF41),
      chart2: const Color(0xFFFF00FF),
      chart3: const Color(0xFF00D4FF),
      chart4: const Color(0xFFFFFF00),
      chart5: const Color(0xFFFF0055),
      radiusScale: 0.3, // Sharp edges
      spacingScale: 1.0,
      shadowIntensity: 0.5,
      fontFamily: 'Ubuntu', // Monospace-ish
      // Enable subtle neon glow effect
      enableBorderGlow: true,
      glowColor: const Color(0xFF00FF41),
      glowIntensity: 0.3, // Reduced for subtler effect
      glowSpread: 4.0,
    );
  }

  /// Neo-Brutalism theme - high contrast, thick black borders, hard offset shadows
  static GlobalTheme neoBrutalism() {
    return GlobalTheme(
      primary: const Color(0xFFFFE600), // Bright yellow
      primaryForeground: const Color(0xFF000000),
      secondary: const Color(0xFFFF6B6B), // Coral red
      secondaryForeground: const Color(0xFF000000),
      background: const Color(0xFFFFFBEB), // Warm white
      foreground: const Color(0xFF000000),
      card: const Color(0xFFFFFFFF), // Pure white cards
      cardForeground: const Color(0xFF000000),
      muted: const Color(0xFFF5F5F5),
      mutedForeground: const Color(0xFF666666),
      border: const Color(0xFF000000), // Solid black borders
      input: const Color(0xFFFFFFFF),
      ring: const Color(0xFF000000),
      destructive: const Color(0xFFFF4444),
      destructiveForeground: const Color(0xFFFFFFFF),
      accent: const Color(0xFF00D4FF), // Bright cyan
      accentForeground: const Color(0xFF000000),
      chart1: const Color(0xFFFFE600),
      chart2: const Color(0xFFFF6B6B),
      chart3: const Color(0xFF00D4FF),
      chart4: const Color(0xFF9B59B6),
      chart5: const Color(0xFF2ECC71),
      radiusScale: 0.0, // Sharp edges - no rounding
      spacingScale: 1.1,
      shadowIntensity: 2.0,
      fontFamily: 'Inter',
      // Neo-Brutalism specific
      borderWidth: 3.0, // Thick black borders
      enableHardShadow: true, // Hard offset shadow behind cards
      hardShadowOffsetX: 5.0,
      hardShadowOffsetY: 5.0,
    );
  }

  /// Monochrome/Wireframe theme - black and white blueprint look
  static GlobalTheme monochrome() {
    return GlobalTheme(
      primary: const Color(0xFF000000),
      primaryForeground: const Color(0xFFFFFFFF),
      secondary: const Color(0xFFFFFFFF),
      secondaryForeground: const Color(0xFF000000),
      background: const Color(0xFFFFFFFF),
      foreground: const Color(0xFF000000),
      card: const Color(0xFFFFFFFF),
      cardForeground: const Color(0xFF000000),
      muted: const Color(0xFFF0F0F0),
      mutedForeground: const Color(0xFF666666),
      border: const Color(0xFF000000),
      input: const Color(0xFFFFFFFF),
      ring: const Color(0xFF000000),
      destructive: const Color(0xFF000000),
      destructiveForeground: const Color(0xFFFFFFFF),
      accent: const Color(0xFF000000),
      accentForeground: const Color(0xFFFFFFFF),
      radiusScale: 0.3,
      fontFamily: 'Courier New',
      borderWidth: 2.0,
    );
  }

  /// Retro Seaside theme - warm cream, red/teal/orange accents
  /// Based on TweakCN style with coastal palette
  static GlobalTheme retroWindows() {
    return GlobalTheme(
      primary: const Color(0xFFD33F6A), // Rich pink/red
      primaryForeground: const Color(0xFFFFFFFF),
      secondary: const Color(0xFF5DBCB8), // Teal
      secondaryForeground: const Color(0xFFFFFFFF),
      background: const Color(0xFFF5EDDC), // Warm cream
      foreground: const Color(0xFF2A4058),
      card: const Color(0xFFE8DFC8), // Slightly darker cream
      cardForeground: const Color(0xFF2A4058),
      muted: const Color(0xFF8FB8B5),
      mutedForeground: const Color(0xFF2A4058),
      popover: const Color(0xFFE8DFC8),
      popoverForeground: const Color(0xFF2A4058),
      border: const Color(0xFF7AAAA8),
      input: const Color(0xFF7AAAA8),
      ring: const Color(0xFFD33F6A),
      destructive: const Color(0xFFD64550),
      destructiveForeground: const Color(0xFFFFFFFF),
      accent: const Color(0xFFD07B42), // Orange accent
      accentForeground: const Color(0xFFFFFFFF),
      chart1: const Color(0xFF4A7999),
      chart2: const Color(0xFF5DBCB8),
      chart3: const Color(0xFFD33F6A),
      chart4: const Color(0xFFD07B42),
      chart5: const Color(0xFFD64550),
      radiusScale: 0.5, // Slightly rounded
      spacingScale: 1.0,
      shadowIntensity: 0.15,
      fontFamily: 'Outfit',
    );
  }

  /// Bento/Apple-Style theme - squircle cards, soft shadows, iOS look
  static GlobalTheme bento() {
    return GlobalTheme(
      primary: const Color(0xFF007AFF), // iOS blue
      primaryForeground: const Color(0xFFFFFFFF),
      secondary: const Color(0xFFF2F2F7), // iOS light grey
      secondaryForeground: const Color(0xFF000000),
      background: const Color(0xFFF2F2F7),
      foreground: const Color(0xFF000000),
      card: const Color(0xFFFFFFFF),
      cardForeground: const Color(0xFF000000),
      muted: const Color(0xFFE5E5EA),
      mutedForeground: const Color(0xFF8E8E93),
      border: const Color(0xFFD1D1D6),
      input: const Color(0xFFFFFFFF),
      ring: const Color(0xFF007AFF),
      destructive: const Color(0xFFFF3B30),
      destructiveForeground: const Color(0xFFFFFFFF),
      accent: const Color(0xFF34C759), // iOS green
      accentForeground: const Color(0xFFFFFFFF),
      radiusScale: 2.5, // Large squircle corners
      shadowIntensity: 0.3, // Soft subtle shadows
      fontFamily: 'SF Pro',
      enableNeumorphism: true,
      neumorphismIntensity: 0.15, // Very subtle soft shadows
    );
  }
}
