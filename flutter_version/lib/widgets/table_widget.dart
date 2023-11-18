import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataTableExample extends StatefulWidget {
  const DataTableExample({super.key, required this.title, required this.numItems, required this.contents});
  final String title;
  final int numItems;
  final LinkedHashMap<String, String> contents;

  @override
  State<DataTableExample> createState() => _DataTableExampleState();
}

class _DataTableExampleState extends State<DataTableExample> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DataTable(
        columns: <DataColumn>[
          DataColumn(
            label: Text(widget.title),
          ),
        ],
        rows: List<DataRow>.generate(
          widget.numItems,
              (int index) => DataRow(
            color: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  // Even rows will have a grey color.
                  if (index.isEven) {
                    return Colors.grey.withOpacity(0.3);
                  }
                  return null; // Use default value for other states and odd rows.
                }),
            cells: <DataCell>[DataCell(Text('${widget.contents.keys.elementAt(index)}: ${widget.contents.values.elementAt(index)}'))],
          ),
        ),
      ),
    );
  }
}
