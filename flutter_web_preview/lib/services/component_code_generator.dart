import '../models/global_theme.dart';

class ComponentCodeGenerator {
  /// Generate colors.dart theme file
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

  /// Get all theme files as a map
  static Map<String, String> generateAllThemeFiles(GlobalTheme theme) {
    return {
      'colors.dart': generateColorsFile(theme),
      'typography.dart': generateTypographyFile(theme),
      'radius.dart': generateRadiusFile(theme),
      'spacing.dart': generateSpacingFile(theme),
      'shadows.dart': generateShadowsFile(theme),
    };
  }

  /// Legacy method for backward compatibility (now returns colors.dart)
  @Deprecated('Use generateAllThemeFiles instead')
  static String generateThemeConfig(GlobalTheme theme) {
    return generateColorsFile(theme);
  }
}
