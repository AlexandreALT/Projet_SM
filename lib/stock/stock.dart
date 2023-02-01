import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projet_sm/Services/productDB.dart';
import 'package:projet_sm/Services/referenceDB.dart';
import 'package:projet_sm/models/product.dart';
import 'package:projet_sm/models/reference.dart';
import 'package:projet_sm/stock/consumable.dart';
import 'package:projet_sm/stock/consumableListWidget.dart';
import 'package:projet_sm/stock/referenceListWidget.dart';
import 'package:projet_sm/tools/menu.dart';
import 'package:projet_sm/tools/search_bar.dart';
import 'package:projet_sm/stock/tool_list.dart';

class Stock extends StatefulWidget {
  Stock({Key? key}) : super(key: key);

  @override
  State<Stock> createState() => _StockState();
}

class _StockState extends State<Stock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              color: Colors.black,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Magasin",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      drawer: Menu(),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            SearchBar(),
            Expanded(
              child: ReferenceListWidget(),
            ),
            Expanded(child: ConsumableListWidget()),
          ])),
      floatingActionButton: Container(
          height: 50,
          width: MediaQuery.of(context).size.width - 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/add_product');
            },
            child: const Text(
              'Ajouter un produit',
              style: TextStyle(fontSize: 20),
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
