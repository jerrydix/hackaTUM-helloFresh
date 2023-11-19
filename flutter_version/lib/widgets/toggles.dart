import 'package:flutter/material.dart';

import 'package:flutter_version/widgets/toggle_product.dart';

class toggles extends StatefulWidget {
  toggles({super.key, required this.products, required this.selectedProducts});
  final List<String> products;
  final List<String> selectedProducts;
  bool enabled = false;

  @override
  _togglesState createState() => _togglesState();
}

class _togglesState extends State<toggles> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        children: List<Widget>.generate(
          widget.products.length,
              (int index) => toggleProduct(title: widget.products[index], enabled: widget.selectedProducts.contains(widget.products[index]), selected: widget.selectedProducts,),
        ),
      ),
    );
  }
}
