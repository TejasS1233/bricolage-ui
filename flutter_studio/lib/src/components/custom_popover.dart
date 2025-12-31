import 'package:flutter/material.dart';

enum PopoverPosition { top, bottom, left, right }

class CustomPopover extends StatefulWidget {
  final Widget child;
  final Widget content;
  final PopoverPosition position;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderRadius;
  final double elevation;
  final EdgeInsets padding;
  final double? width;
  final bool showArrow;

  const CustomPopover({
    super.key,
    required this.child,
    required this.content,
    this.position = PopoverPosition.top,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius = 8.0,
    this.elevation = 4.0,
    this.padding = const EdgeInsets.all(12),
    this.width,
    this.showArrow = true,
  });

  @override
  State<CustomPopover> createState() => _CustomPopoverState();
}

class _CustomPopoverState extends State<CustomPopover> {
  final GlobalKey _key = GlobalKey();
  OverlayEntry? _overlayEntry;
  bool _isVisible = false;

  void _showPopover() {
    if (_isVisible) return;

    final renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Barrier to dismiss
          Positioned.fill(
            child: GestureDetector(
              onTap: _hidePopover,
              child: Container(color: Colors.transparent),
            ),
          ),
          // Popover
          _buildPopover(offset, size),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    setState(() => _isVisible = true);
  }

  void _hidePopover() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    if (mounted) setState(() => _isVisible = false);
  }

  Widget _buildPopover(Offset offset, Size size) {
    double left = offset.dx;
    double top = offset.dy;

    switch (widget.position) {
      case PopoverPosition.top:
        top = offset.dy - 8;
        break;
      case PopoverPosition.bottom:
        top = offset.dy + size.height + 8;
        break;
      case PopoverPosition.left:
        left = offset.dx - (widget.width ?? 200) - 8;
        top = offset.dy + size.height / 2;
        break;
      case PopoverPosition.right:
        left = offset.dx + size.width + 8;
        top = offset.dy + size.height / 2;
        break;
    }

    return Positioned(
      left: left,
      top: top,
      width: widget.width ?? 200,
      child: Material(
        elevation: widget.elevation,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        color: widget.backgroundColor ?? Colors.white,
        child: Container(
          padding: widget.padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(
              color: widget.borderColor ?? Colors.grey.shade300,
            ),
          ),
          child: widget.content,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _key,
      onTap: _isVisible ? _hidePopover : _showPopover,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _hidePopover();
    super.dispose();
  }
}
