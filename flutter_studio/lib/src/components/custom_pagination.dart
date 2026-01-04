import 'package:flutter/material.dart';
import '../theme/theme.dart';

class CustomPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int>? onPageChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? textColor;
  final Color? activeTextColor;
  final double CustomButtonVariant;
  final double fontSize;
  final bool showFirstLast;

  const CustomPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    this.onPageChanged,
    this.activeColor,
    this.inactiveColor,
    this.textColor,
    this.activeTextColor,
    this.CustomButtonVariant = 40.0,
    this.fontSize = UITypography.fontSizeSM,
    this.showFirstLast = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showFirstLast)
          _buildButton(
            child: const Icon(Icons.first_page, size: 18),
            onTap: currentPage > 1 ? () => onPageChanged?.call(1) : null,
          ),
        _buildButton(
          child: const Icon(Icons.chevron_left, size: 18),
          onTap: currentPage > 1
              ? () => onPageChanged?.call(currentPage - 1)
              : null,
        ),
        const SizedBox(width: UISpacing.sm),
        ..._buildPageNumbers(),
        const SizedBox(width: UISpacing.sm),
        _buildButton(
          child: const Icon(Icons.chevron_right, size: 18),
          onTap: currentPage < totalPages
              ? () => onPageChanged?.call(currentPage + 1)
              : null,
        ),
        if (showFirstLast)
          _buildButton(
            child: const Icon(Icons.last_page, size: 18),
            onTap: currentPage < totalPages
                ? () => onPageChanged?.call(totalPages)
                : null,
          ),
      ],
    );
  }

  List<Widget> _buildPageNumbers() {
    List<Widget> pages = [];
    int start = (currentPage - 2).clamp(1, totalPages);
    int end = (currentPage + 2).clamp(1, totalPages);

    if (start > 1) {
      pages.add(_buildPageButton(1));
      if (start > 2) pages.add(_buildEllipsis());
    }

    for (int i = start; i <= end; i++) {
      pages.add(_buildPageButton(i));
    }

    if (end < totalPages) {
      if (end < totalPages - 1) pages.add(_buildEllipsis());
      pages.add(_buildPageButton(totalPages));
    }

    return pages;
  }

  Widget _buildPageButton(int page) {
    final isActive = page == currentPage;
    return GestureDetector(
      onTap: !isActive ? () => onPageChanged?.call(page) : null,
      child: Container(
        width: CustomButtonVariant,
        height: CustomButtonVariant,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: isActive
              ? (activeColor ?? UIColors.primary)
              : (inactiveColor ?? UIColors.background.withValues(alpha: 0.0)),
          borderRadius: BorderRadius.circular(UIRadius.md),
          border: Border.all(
            color:
                isActive ? (activeColor ?? UIColors.primary) : UIColors.border,
            width: UIBorder.thin,
          ),
        ),
        child: Center(
          child: Text(
            '$page',
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              color: isActive
                  ? (activeTextColor ?? UIColors.primaryForeground)
                  : (textColor ?? UIColors.foreground),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton({required Widget child, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: CustomButtonVariant,
        height: CustomButtonVariant,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: onTap != null
              ? (inactiveColor ?? UIColors.background.withValues(alpha: 0.0))
              : UIColors.gray100,
          borderRadius: BorderRadius.circular(UIRadius.md),
          border: Border.all(color: UIColors.border, width: UIBorder.thin),
        ),
        child: Center(child: child),
      ),
    );
  }

  Widget _buildEllipsis() {
    return Container(
      width: CustomButtonVariant,
      height: CustomButtonVariant,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: const Center(
        child: Text('...', style: TextStyle(fontSize: UITypography.fontSizeSM)),
      ),
    );
  }
}
