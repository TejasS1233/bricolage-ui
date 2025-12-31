import 'package:flutter/material.dart';

enum ToggleMode { single, multiple }

class CustomToggleGroup extends StatefulWidget {
  final List<String> items;
  final List<int> selectedIndexes;
  final ValueChanged<List<int>>? onChanged;
  final ToggleMode mode;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;
  final Color? borderColor;
  final double borderRadius;
  final double borderWidth;
  final EdgeInsets padding;
  final double fontSize;

  const CustomToggleGroup({
    super.key,
    required this.items,
    this.selectedIndexes = const [],
    this.onChanged,
    this.mode = ToggleMode.single,
    this.selectedColor,
    this.unselectedColor,
    this.selectedTextColor,
    this.unselectedTextColor,
    this.borderColor,
    this.borderRadius = 8.0,
    this.borderWidth = 1.5,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.fontSize = 14.0,
  });

  @override
  State<CustomToggleGroup> createState() => _CustomToggleGroupState();
}

class _CustomToggleGroupState extends State<CustomToggleGroup> {
  late List<int> _selectedIndexes;

  @override
  void initState() {
    super.initState();
    _selectedIndexes = List.from(widget.selectedIndexes);
  }

  void _handleTap(int index) {
    setState(() {
      if (widget.mode == ToggleMode.single) {
        _selectedIndexes = [index];
      } else {
        if (_selectedIndexes.contains(index)) {
          _selectedIndexes.remove(index);
        } else {
          _selectedIndexes.add(index);
        }
      }
    });
    widget.onChanged?.call(_selectedIndexes);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.borderColor ?? Colors.grey[300]!,
          width: widget.borderWidth,
        ),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: widget.items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isSelected = _selectedIndexes.contains(index);
          final isFirst = index == 0;
          final isLast = index == widget.items.length - 1;

          return Flexible(
            child: GestureDetector(
              onTap: () => _handleTap(index),
              child: Container(
                padding: widget.padding,
                decoration: BoxDecoration(
                  color: isSelected
                      ? (widget.selectedColor ?? Colors.blue)
                      : (widget.unselectedColor ?? Colors.transparent),
                  border: index < widget.items.length - 1
                      ? Border(
                          right: BorderSide(
                            color: widget.borderColor ?? Colors.grey[300]!,
                            width: widget.borderWidth,
                          ),
                        )
                      : null,
                  borderRadius: BorderRadius.only(
                    topLeft: isFirst ? Radius.circular(widget.borderRadius - widget.borderWidth) : Radius.zero,
                    bottomLeft: isFirst ? Radius.circular(widget.borderRadius - widget.borderWidth) : Radius.zero,
                    topRight: isLast ? Radius.circular(widget.borderRadius - widget.borderWidth) : Radius.zero,
                    bottomRight: isLast ? Radius.circular(widget.borderRadius - widget.borderWidth) : Radius.zero,
                  ),
                ),
                child: Center(
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: widget.fontSize,
                      color: isSelected
                          ? (widget.selectedTextColor ?? Colors.white)
                          : (widget.unselectedTextColor ?? Colors.black87),
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
