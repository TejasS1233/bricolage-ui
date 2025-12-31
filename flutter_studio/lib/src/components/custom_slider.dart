import 'package:flutter/material.dart';
import '../theme/colors.dart';

class CustomSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double>? onChanged;
  final double min;
  final double max;
  final int? divisions;
  final String? label;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? thumbColor;

  const CustomSlider({
    super.key,
    required this.value,
    this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.label,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: const TextStyle(
              color: UIColors.foreground,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
        ],
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: activeColor ?? UIColors.primary,
            inactiveTrackColor: inactiveColor ?? UIColors.muted,
            thumbColor: thumbColor ?? UIColors.primary,
            overlayColor: Color.fromRGBO(
              (activeColor ?? UIColors.primary).red,
              (activeColor ?? UIColors.primary).green,
              (activeColor ?? UIColors.primary).blue,
              0.1,
            ),
            trackHeight: 4.0,
          ),
          child: Slider(
            value: value,
            onChanged: onChanged,
            min: min,
            max: max,
            divisions: divisions,
          ),
        ),
      ],
    );
  }
}
