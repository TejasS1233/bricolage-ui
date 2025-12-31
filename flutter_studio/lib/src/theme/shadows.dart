import 'package:flutter/material.dart';

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
