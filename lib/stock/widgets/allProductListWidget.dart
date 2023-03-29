import 'package:flutter/material.dart';
import 'package:projet_sm/models/reference.dart';
import 'package:projet_sm/stock/widgets/consumable.dart';
import 'package:projet_sm/stock/widgets/tool_list.dart';

import '../../Services/productDB.dart';
import '../../models/product.dart';

class AllProductListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: ProductDB().getAllProduct(),
      builder: (context, snapshot) {
        List<String> tableau = [];
        List<Widget> toolListWidgets = [];
        if (snapshot.data != null) {
          snapshot.data!.forEach((product) {
            if (product.categorie == "Consommable") {
              toolListWidgets.add(
                Consumable(
                  quantity: product.quantite!,
                  reference: product.reference,
                ),
              );
            } else {
              if (!tableau.contains(product.reference)) {
                tableau.add(product.reference);
              }
            }
          });
          tableau.forEach((value) {
            var reference = Reference(reference: value);
            toolListWidgets.add(
              ToolList(reference: reference),
            );
          });
          return ListView.builder(
            itemCount: toolListWidgets.length,
            itemBuilder: (context, index) {
              return toolListWidgets[index];
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}