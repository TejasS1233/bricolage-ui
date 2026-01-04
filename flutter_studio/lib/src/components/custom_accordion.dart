import 'package:flutter/material.dart';
import '../theme/theme.dart';

class CustomAccordion extends StatefulWidget {
  final String title;
  final Widget content;
  final bool initiallyExpanded;
  final Color? backgroundColor;
  final Color? titleColor;

  const CustomAccordion({
    super.key,
    required this.title,
    required this.content,
    this.initiallyExpanded = false,
    this.backgroundColor,
    this.titleColor,
  });

  @override
  State<CustomAccordion> createState() => _CustomAccordionState();
}

class _CustomAccordionState extends State<CustomAccordion> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: UIColors.border),
        borderRadius: BorderRadius.circular(UIRadius.lg),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            widget.title,
            style: TextStyle(
              color: widget.titleColor ?? UIColors.foreground,
              fontWeight: UITypography.fontWeightMedium,
            ),
          ),
          initiallyExpanded: _isExpanded,
          onExpansionChanged: (expanded) {
            setState(() => _isExpanded = expanded);
          },
          children: [
            Padding(
              padding: const EdgeInsets.all(UISpacing.md),
              child: widget.content,
            ),
          ],
        ),
      ),
    );
  }
}
