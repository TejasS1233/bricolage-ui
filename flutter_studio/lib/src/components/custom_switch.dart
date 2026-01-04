import 'package:flutter/material.dart';
import '../theme/theme.dart';

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
      inactiveThumbColor: inactiveColor ?? UIColors.gray400,
      activeTrackColor:
          (activeColor ?? UIColors.primary).withValues(alpha: 0.5),
      inactiveTrackColor: trackColor ?? UIColors.muted,
    );

    if (label != null) {
      return MergeSemantics(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label!,
              style: TextStyle(
                color: UIColors.foreground,
                fontSize: UITypography.fontSizeSM,
              ),
            ),
            const SizedBox(width: UISpacing.md * 0.75),
            switchWidget,
          ],
        ),
      );
    }

    return switchWidget;
  }
}
