import 'package:flutter/material.dart';
import '../theme/theme.dart';

class CustomSkeleton extends StatefulWidget {
  final double? width;
  final double? height;
  final double? borderRadius;

  const CustomSkeleton({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
  });

  @override
  State<CustomSkeleton> createState() => _CustomSkeletonState();
}

class _CustomSkeletonState extends State<CustomSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
          width: widget.width,
          height: widget.height ?? 16,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                UIColors.muted,
                UIColors.gray100,
                UIColors.muted,
              ],
              stops: [
                _controller.value - 0.3,
                _controller.value,
                _controller.value + 0.3,
              ].map((v) => v.clamp(0.0, 1.0)).toList(),
            ),
            borderRadius:
                BorderRadius.circular(widget.borderRadius ?? UIRadius.md),
          ),
        );
        },
      ),
    );
  }
}
