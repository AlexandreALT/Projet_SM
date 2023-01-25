import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projet_sm/models/product.dart';

import '../Services/productDB.dart';
import '../chantiers/chantier.dart';

// Récupérer image from XFile path : Image.file(File(path))

class ModifProduct extends StatelessWidget {
  ModifProduct({Key? key, required this.image}) : super(key: key);

  final image;

  var namecontroller = TextEditingController();
  var refcontroller = TextEditingController();
  var quantitecontroller = TextEditingController();
  var categoriecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.blue,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        title: const Text(
          "Modifier le produit",
          style: TextStyle(color: Colors.blue, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.4,
                color: Color.fromRGBO(232, 232, 232, 1.0),
                child: image == null
                    ? IconButton(
                        icon: Icon(Icons.add_a_photo, color: Colors.black),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/choice_picture');
                        },
                      )
                    : Image.file(
                        File(image.path),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.text,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                filled: true,
                fillColor: Color.fromRGBO(232, 232, 232, 1.0),
                hintText: 'Nom du produit',
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: refcontroller,
              keyboardType: TextInputType.text,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                filled: true,
                fillColor: Color.fromRGBO(232, 232, 232, 1.0),
                hintText: 'Référence',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.pushNamed(context, '/add_reference');
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: quantitecontroller,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                filled: true,
                fillColor: Color.fromRGBO(232, 232, 232, 1.0),
                hintText: 'Nom au dépot',
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: categoriecontroller,
              keyboardType: TextInputType.text,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                filled: true,
                fillColor: Color.fromRGBO(232, 232, 232, 1.0),
                hintText: 'Catégorie',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.pushNamed(context, '/add_category');
                  },
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 15),
            Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 15,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                    ),
                    onPressed: () async {
                      var product = new Product(
                          nom: namecontroller.text,
                          categorie: categoriecontroller.text,
                          quantite: int.parse(quantitecontroller.text),
                          reference: refcontroller.text,
                          image: image.path,
                          date_ajout: '',
                          statut: '');
                      await ProductDB().addProduct(product);
                      Navigator.pushNamed(context, '/new_product');
                    },
                    child: const Text(
                      'Valider',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
