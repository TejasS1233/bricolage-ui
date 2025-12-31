import 'package:flutter/material.dart';

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
