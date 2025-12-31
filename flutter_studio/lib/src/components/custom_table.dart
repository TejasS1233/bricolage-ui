import 'package:flutter/material.dart';

class TableColumn {
  final String header;
  final double? width;
  final bool sortable;

  const TableColumn({
    required this.header,
    this.width,
    this.sortable = false,
  });
}

class CustomTable extends StatefulWidget {
  final List<TableColumn> columns;
  final List<List<String>> rows;
  final Color? headerBackgroundColor;
  final Color? headerTextColor;
  final Color? rowBackgroundColor;
  final Color? alternateRowColor;
  final Color? borderColor;
  final double fontSize;
  final double headerFontSize;
  final EdgeInsets cellPadding;
  final bool showBorder;

  const CustomTable({
    super.key,
    required this.columns,
    required this.rows,
    this.headerBackgroundColor,
    this.headerTextColor,
    this.rowBackgroundColor,
    this.alternateRowColor,
    this.borderColor,
    this.fontSize = 14.0,
    this.headerFontSize = 14.0,
    this.cellPadding = const EdgeInsets.all(12),
    this.showBorder = true,
  });

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  int? _sortColumnIndex;
  bool _sortAscending = true;
  List<List<String>> _sortedRows = [];

  @override
  void initState() {
    super.initState();
    _sortedRows = List.from(widget.rows);
  }

  void _sort(int columnIndex) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = !_sortAscending;
      _sortedRows.sort((a, b) {
        final comparison = a[columnIndex].compareTo(b[columnIndex]);
        return _sortAscending ? comparison : -comparison;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: widget.showBorder
            ? Border.all(color: widget.borderColor ?? Colors.grey.shade300)
            : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Table(
            defaultColumnWidth: const IntrinsicColumnWidth(),
            border: widget.showBorder
                ? TableBorder.symmetric(
                    inside: BorderSide(color: widget.borderColor ?? Colors.grey.shade300),
                  )
                : null,
            children: [
              // Header
              TableRow(
                decoration: BoxDecoration(
                  color: widget.headerBackgroundColor ?? Colors.grey.shade100,
                ),
                children: widget.columns.asMap().entries.map((entry) {
                  final index = entry.key;
                  final column = entry.value;
                  return TableCell(
                    child: InkWell(
                      onTap: column.sortable ? () => _sort(index) : null,
                      child: Container(
                        padding: widget.cellPadding,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              column.header,
                              style: TextStyle(
                                fontSize: widget.headerFontSize,
                                fontWeight: FontWeight.w600,
                                color: widget.headerTextColor ?? Colors.grey[800],
                              ),
                            ),
                            if (column.sortable) ...[
                              const SizedBox(width: 4),
                              Icon(
                                _sortColumnIndex == index
                                    ? (_sortAscending ? Icons.arrow_upward : Icons.arrow_downward)
                                    : Icons.unfold_more,
                                size: 16,
                                color: Colors.grey[600],
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              // Rows
              ..._sortedRows.asMap().entries.map((entry) {
                final rowIndex = entry.key;
                final row = entry.value;
                return TableRow(
                  decoration: BoxDecoration(
                    color: rowIndex.isEven
                        ? (widget.rowBackgroundColor ?? Colors.white)
                        : (widget.alternateRowColor ?? Colors.grey.shade50),
                  ),
                  children: row.map((cell) {
                    return TableCell(
                      child: Container(
                        padding: widget.cellPadding,
                        child: Text(
                          cell,
                          style: TextStyle(fontSize: widget.fontSize),
                        ),
                      ),
                    );
                  }).toList(),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
