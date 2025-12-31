import 'package:flutter/material.dart';
import '../theme/colors.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final String? label;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? trackColor;

  const CustomSwitch({
    super.key,
    required this.value,
    this.onChanged,
    this.label,
    this.activeColor,
    this.inactiveColor,
    this.trackColor,
  });

  @override
  Widget build(BuildContext context) {
    final switchWidget = Switch(
      value: value,
      onChanged: onChanged,
      activeColor: activeColor ?? UIColors.primary,
      inactiveThumbColor: inactiveColor ?? UIColors.gray300,
      activeTrackColor: Color.fromRGBO(
        (activeColor ?? UIColors.primary).red,
        (activeColor ?? UIColors.primary).green,
        (activeColor ?? UIColors.primary).blue,
        0.5,
      ),
      inactiveTrackColor: trackColor ?? UIColors.muted,
    );

    if (label != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label!,
            style: const TextStyle(
              color: UIColors.foreground,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 12),
          switchWidget,
        ],
      );
    }

    return switchWidget;
  }
}
