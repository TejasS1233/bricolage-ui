import 'package:flutter/material.dart';
import '../theme/theme.dart';

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
    this.borderRadius = UIRadius.md,
    this.elevation = 4.0,
    this.fontSize = UITypography.fontSizeSM,
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
              child:
                  Container(color: UIColors.background.withValues(alpha: 0.0)),
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
              color: widget.backgroundColor ?? UIColors.background,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  border: Border.all(color: UIColors.gray200),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: widget.items.map((item) {
                    if (item.isDivider) {
                      return Divider(
                          height: UIBorder.thin, color: UIColors.gray300);
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
        padding: const EdgeInsets.symmetric(
            horizontal: UISpacing.md, vertical: UISpacing.md / 1.33),
        child: Row(
          children: [
            if (item.icon != null) ...[
              Icon(item.icon,
                  size: 18, color: widget.textColor ?? UIColors.gray700),
              const SizedBox(width: UISpacing.md / 1.33),
            ],
            Text(
              item.label,
              style: TextStyle(
                fontSize: widget.fontSize,
                color: widget.textColor ?? UIColors.gray800,
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
