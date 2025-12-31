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
  double radiusScale; // 0.0 to 2.0
  double spacingScale; // 0.5 to 2.0
  double shadowIntensity; // 0.0 to 2.0

  // Typography
  double fontSizeScale; // 0.75 to 1.5
  double lineHeightScale; // 0.8 to 1.6
  String fontFamily; // Font family name

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
      chart4: chart4 ?? this.chart5,
      chart5: chart5 ?? this.chart5,
      radiusScale: radiusScale ?? this.radiusScale,
      spacingScale: spacingScale ?? this.spacingScale,
      shadowIntensity: shadowIntensity ?? this.shadowIntensity,
      fontSizeScale: fontSizeScale ?? this.fontSizeScale,
      lineHeightScale: lineHeightScale ?? this.lineHeightScale,
      fontFamily: fontFamily ?? this.fontFamily,
    );
  }
}
