import 'package:flutter/material.dart';

class DropdownItem {
  final String label;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool isDivider;

  const DropdownItem({
    this.label = '',
    this.icon,
    this.onTap,
    this.isDivider = false,
  });

  const DropdownItem.divider() : this(isDivider: true);
}

class CustomDropdown extends StatefulWidget {
  final Widget trigger;
  final List<DropdownItem> items;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? hoverColor;
  final double borderRadius;
  final double elevation;
  final double fontSize;
  final double? width;

  const CustomDropdown({
    super.key,
    required this.trigger,
    required this.items,
    this.backgroundColor,
    this.textColor,
    this.hoverColor,
    this.borderRadius = 8.0,
    this.elevation = 4.0,
    this.fontSize = 14.0,
    this.width,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final GlobalKey _key = GlobalKey();
  OverlayEntry? _overlayEntry;

  void _showDropdown() {
    final renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Barrier to dismiss
          Positioned.fill(
            child: GestureDetector(
              onTap: _hideDropdown,
              child: Container(color: Colors.transparent),
            ),
          ),
          // Dropdown menu
          Positioned(
            left: offset.dx,
            top: offset.dy + size.height + 4,
            width: widget.width ?? size.width,
            child: Material(
              elevation: widget.elevation,
              borderRadius: BorderRadius.circular(widget.borderRadius),
              color: widget.backgroundColor ?? Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: widget.items.map((item) {
                    if (item.isDivider) {
                      return Divider(height: 1, color: Colors.grey.shade300);
                    }
                    return _buildMenuItem(item);
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  Widget _buildMenuItem(DropdownItem item) {
    return InkWell(
      onTap: () {
        _hideDropdown();
        item.onTap?.call();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            if (item.icon != null) ...[
              Icon(item.icon, size: 18, color: widget.textColor ?? Colors.grey[700]),
              const SizedBox(width: 12),
            ],
            Text(
              item.label,
              style: TextStyle(
                fontSize: widget.fontSize,
                color: widget.textColor ?? Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _key,
      onTap: _showDropdown,
      child: widget.trigger,
    );
  }

  @override
  void dispose() {
    _hideDropdown();
    super.dispose();
  }
}
