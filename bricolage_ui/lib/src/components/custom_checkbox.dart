import 'package:flutter/material.dart';
import '../theme/theme.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final String? label;
  final Color? activeColor;
  final Color? checkColor;
  final Color? borderColor;
  final double? size;

  const CustomCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.label,
    this.activeColor,
    this.checkColor,
    this.borderColor,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final checkbox = SizedBox(
      width: size ?? 20,
      height: size ?? 20,
      child: Checkbox(
        value: value,
        onChanged: onChanged,
        activeColor: activeColor ?? UIColors.primary,
        checkColor: checkColor ?? UIColors.white,
        side: BorderSide(
          color: borderColor ?? UIColors.border,
          width: UIBorder.thick,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UIRadius.sm),
        ),
      ),
    );

    if (label != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          checkbox,
          const SizedBox(width: UISpacing.sm),
          Text(
            label!,
            style: TextStyle(
              color: UIColors.foreground,
              fontSize: UITypography.fontSizeSM,
            ),
          ),
        ],
      );
    }

    return checkbox;
  }
}
