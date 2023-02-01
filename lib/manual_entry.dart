import 'package:flutter/material.dart';
import 'package:projet_sm/Services/productDB.dart';
import 'package:projet_sm/models/product.dart';
import 'package:projet_sm/scan_result.dart';
import 'package:projet_sm/tools/menu.dart';

class ManualEntry extends StatelessWidget {
  ManualEntry({Key? key}) : super(key: key);

  var numeroSerieController = TextEditingController();

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
          "Recherche manuelle",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      drawer: Menu(),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 100),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Entrez le numéro de série de l\'outil que vous souhaitez affecter dans un chantier.',
                    style: TextStyle(fontSize: 20),
                  )),
              const SizedBox(height: 30),
              TextFormField(
                controller: numeroSerieController,
                keyboardType: TextInputType.text,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  hintText: 'N° de série l\'outil',
                  filled: true,
                  fillColor: Color.fromRGBO(232, 232, 232, 1.0),
                ),
              ),
            ],
          )),
      floatingActionButton: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
            ),
            onPressed: () async{
              var produit = await ProductDB().getProduct(numeroSerieController.text);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ScanResult(product: produit)));
            },
            child: const Text(
              'Affecter',
              style: TextStyle(fontSize: 20),
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
