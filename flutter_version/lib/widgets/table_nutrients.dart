import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_version/rest/ingredient.dart';


class DataTableExample2 extends StatefulWidget {
  const DataTableExample2({super.key, required this.title, required this.numItems, required this.names, required this.values});
  final String title;
  final int numItems;
  final List<String> names;
  final List<String> values;

  @override
  State<DataTableExample2> createState() => _DataTableExampleState();
}

class _DataTableExampleState extends State<DataTableExample2> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            cells: <DataCell>[DataCell(Text('${widget.names[index]}: ${widget.values[index]}'))],
          ),
        ),
      ),
    );
  }
}
