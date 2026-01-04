import 'package:flutter/material.dart';
import '../theme/theme.dart';

enum SpinnerType { circular, dots, pulse }

class CustomSpinner extends StatefulWidget {
  final SpinnerType type;
  final double size;
  final Color? color;
  final double strokeWidth;

  const CustomSpinner({
    super.key,
    this.type = SpinnerType.circular,
    this.size = 40.0,
    this.color,
    this.strokeWidth = 4.0,
  });

  @override
  State<CustomSpinner> createState() => _CustomSpinnerState();
}

class _CustomSpinnerState extends State<CustomSpinner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(
          milliseconds: widget.type == SpinnerType.pulse ? 1500 : 1200),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case SpinnerType.circular:
        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: CircularProgressIndicator(
            strokeWidth: widget.strokeWidth,
            valueColor: AlwaysStoppedAnimation<Color>(
              widget.color ?? UIColors.primary,
            ),
          ),
        );

      case SpinnerType.dots:
        return SizedBox(
          width: widget.size * 2,
          height: widget.size / 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(3, (index) {
              return AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  final delay = index * 0.2;
                  final value = (_controller.value - delay).clamp(0.0, 1.0);
                  final scale = (1.0 - (value * 2 - 1).abs()) * 0.5 + 0.5;
                  return Transform.scale(
                    scale: scale,
                    child: Container(
                      width: widget.size / 4,
                      height: widget.size / 4,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.color ?? UIColors.primary,
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        );

      case SpinnerType.pulse:
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final scale = (1.0 - _controller.value) * 0.5 + 0.5;
            final opacity = 1.0 - _controller.value;
            return Opacity(
              opacity: opacity,
              child: Transform.scale(
                scale: scale + 0.5,
                child: Container(
                  width: widget.size,
                  height: widget.size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: widget.color ?? UIColors.primary,
                      width: widget.strokeWidth,
                    ),
                  ),
                ),
              ),
            );
          },
        );
    }
  }
}
