import 'package:flutter/material.dart';
import '../theme/colors.dart';

class CustomRadio<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T?>? onChanged;
  final String? label;
  final Color? activeColor;
  final Color? borderColor;

  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    this.onChanged,
    this.label,
    this.activeColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final radio = Radio<T>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      activeColor: activeColor ?? UIColors.primary,
    );

    if (label != null) {
      return InkWell(
        onTap: onChanged != null ? () => onChanged!(value) : null,
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              radio,
              Text(
                label!,
                style: const TextStyle(
                  color: UIColors.foreground,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return radio;
  }
}
