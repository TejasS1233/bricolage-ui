import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/radius.dart';

class CustomSelect<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final ValueChanged<T?>? onChanged;
  final String hint;
  final String Function(T)? itemLabel;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;

  const CustomSelect({
    super.key,
    this.value,
    required this.items,
    this.onChanged,
    this.hint = 'Select an option',
    this.itemLabel,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? UIColors.background,
        border: Border.all(
          color: borderColor ?? UIColors.border,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(borderRadius ?? UIRadius.md),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          isExpanded: true,
          hint: Text(
            hint,
            style: const TextStyle(
              color: UIColors.mutedForeground,
              fontSize: 14,
            ),
          ),
          icon: const Icon(Icons.keyboard_arrow_down, size: 20),
          items: items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(
                itemLabel != null ? itemLabel!(item) : item.toString(),
                style: const TextStyle(
                  color: UIColors.foreground,
                  fontSize: 14,
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
