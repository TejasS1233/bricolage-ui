import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/radius.dart';

class CustomBottomSheet {
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget Function(BuildContext) builder,
    Color? backgroundColor,
    double? elevation,
    bool isScrollControlled = false,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: backgroundColor ?? UIColors.background,
      elevation: elevation ?? 1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(UIRadius.xl)),
      ),
      isScrollControlled: isScrollControlled,
      builder: builder,
    );
  }
}
