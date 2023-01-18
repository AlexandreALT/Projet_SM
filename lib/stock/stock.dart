import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projet_sm/Services/productDB.dart';
import 'package:projet_sm/stock/consumable.dart';
import 'package:projet_sm/tools/menu.dart';
import 'package:projet_sm/tools/search_bar.dart';
import 'package:projet_sm/stock/tool_list.dart';

class Stock extends StatefulWidget {
  Stock({Key? key}) : super(key: key);

  @override
  State<Stock> createState() =>_StockState();
}

class _StockState extends State<Stock> {
  var _futureProduits = ProductDB().getData();
  var listProducts = [];

  @override
  Widget build(BuildContext context) {
    _futureProduits.then((produits) {
      produits.forEach((produit) {
        if (!listProducts.contains(produit)) listProducts.add(produit);
      });
    });
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
        child: ListView(
          children: <Widget>[
            SearchBar(),
            SizedBox(height: 15),
            Column(
              children: List.generate(listProducts.length, (index) {
                return Column(
                  children: [
                    listProducts[index]['categorie'] == 'Consommable'
                        ? Consumable(
                            title: listProducts[index]['name'],
                            quantity: listProducts[index]['quantite'],
                          )
                        : ToolList(
                            title: listProducts[index]['name'],
                            quantite: listProducts[index]['quantite'],
                            reference: listProducts[index]['reference'],
                          ),
                    SizedBox(height: 10),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
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
