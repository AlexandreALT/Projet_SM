import 'package:flutter/material.dart';
import 'package:projet_sm/Services/productDB.dart';
import 'package:projet_sm/Services/referenceDB.dart';
import 'package:projet_sm/models/product.dart';
import 'package:projet_sm/models/reference.dart';
import 'package:projet_sm/stock/consumable.dart';
import 'package:projet_sm/tools/menu.dart';
import 'package:projet_sm/tools/search_bar.dart';
import 'package:projet_sm/stock/tool_list.dart';

class Stock extends StatefulWidget {
  Stock({Key? key}) : super(key: key);

  @override
  State<Stock> createState() => _StockState();
}

class _StockState extends State<Stock> {
  var _futureProduits = ProductDB().getData();
  var _futureReference = ReferenceDB().getData();
  var listReferences = [];

  @override
  Widget build(BuildContext context) {
    _futureReference.then((references) {
      listReferences = [];
      references.forEach((reference) {
        Reference ref = new Reference(
            alias: reference['alias'],
            compteur: reference['compteur'],
            cout: reference['cout'],
            nom: reference['nom'],
            reference: reference['reference']);
        listReferences.add(ref);
      });
    });
    _futureProduits.then((produits) {
      produits.forEach((produit) {
        Product product = new Product(
            categorie: produit['categorie'],
            nom: produit['name'],
            quantite: produit['quantite'],
            reference: produit['reference'],
            image: produit['image'],
            date_ajout: produit['date_ajout'],
            statut: produit['statut']);
        if (product.categorie == 'Consommable' &&
            !listReferences.contains(product)) listReferences.add(product);
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
              //listProducts.length
              children: List.generate(listReferences.length, (index) {
                return Column(
                  children: [
                    listReferences[index] is Reference
                        ? ToolList(reference: listReferences[index])
                        : Consumable(
                            reference: listReferences[index].reference,
                            title: listReferences[index].nom,
                            quantity: listReferences[index].quantite,
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
