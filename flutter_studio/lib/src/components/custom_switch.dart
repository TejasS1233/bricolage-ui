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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final switchWidget = Switch(
      value: value,
      onChanged: onChanged,
      activeColor: activeColor ?? colorScheme.primary,
      inactiveThumbColor: inactiveColor ?? colorScheme.outline,
      activeTrackColor: Color.fromRGBO(
        (activeColor ?? colorScheme.primary).red,
        (activeColor ?? colorScheme.primary).green,
        (activeColor ?? colorScheme.primary).blue,
        0.5,
      ),
      inactiveTrackColor: trackColor ?? colorScheme.surfaceContainerHighest,
    );

    if (label != null) {
      return MergeSemantics(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label!,
              style: TextStyle(
                color: colorScheme.onSurface,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 12),
            switchWidget,
          ],
        ),
      );
    }

    return switchWidget;
  }
}
