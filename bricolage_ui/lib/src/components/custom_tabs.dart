import 'package:flutter/material.dart';
import '../theme/theme.dart';

class CustomTabs extends StatelessWidget {
  final List<String> tabs;
  final int currentIndex;
  final ValueChanged<int>? onTap;
  final Color? indicatorColor;
  final Color? labelColor;
  final Color? unselectedLabelColor;

  const CustomTabs({
    super.key,
    required this.tabs,
    required this.currentIndex,
    this.onTap,
    this.indicatorColor,
    this.labelColor,
    this.unselectedLabelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: UIColors.border, width: UIBorder.thin),
        ),
      ),
      child: TabBar(
        isScrollable: true,
        tabs: tabs.map((tab) => Tab(text: tab)).toList(),
        indicatorColor: indicatorColor ?? UIColors.primary,
        labelColor: labelColor ?? UIColors.foreground,
        unselectedLabelColor: unselectedLabelColor ?? UIColors.mutedForeground,
        labelStyle: const TextStyle(
          fontSize: UITypography.fontSizeSM,
          fontWeight: UITypography.fontWeightMedium,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: UITypography.fontSizeSM,
          fontWeight: UITypography.fontWeightNormal,
        ),
        onTap: onTap,
      ),
    );
  }
}
