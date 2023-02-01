import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:projet_sm/Services/referenceDB.dart';
import 'package:projet_sm/models/product.dart';

import '../Services/productDB.dart';

// Récupérer image from XFile path : Image.file(File(path))

class AddProduct extends StatelessWidget {
  AddProduct({Key? key, required this.image}) : super(key: key);

  final image;

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
          "Ajouter un nouveau produit",
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
                hintText: 'Quantité au magasin',
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
            SizedBox(height: MediaQuery.of(context).size.height / 6),
            Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                    ),
                    onPressed: () async {
                      final storageRef = FirebaseStorage.instance.ref().child('Products/test.jpg');
                      File file = File(image.path);
                      storageRef.putFile(file);

                      var reference = refcontroller.text;

                      var ref = await ReferenceDB().getReference(reference);
                      var serie = ref["compteur"].toString()+ref["alias"];
                      await ReferenceDB().updateReference(reference, 'compteur', ref["compteur"]+1);

                      String jour = DateTime.now().day.toString();
                      String mois = DateTime.now().month.toString();
                      String annee = DateTime.now().year.toString();
                      if (mois.length < 2) mois = "0" + mois;
                      String date = jour + '/' + mois + '/' + annee;
                      var product = new Product(
                        categorie: categoriecontroller.text,
                        quantite: int.parse(quantitecontroller.text),
                        reference: reference,
                        image: image.path,
                        date_ajout: date,
                        statut: "En entrepôt",
                        numeroSerie: serie,
                      );
                      await ProductDB().addProduct(product);
                      Navigator.pushNamed(context, '/new_product');
                    },
                    child: const Text(
                      'Ajouter au magasin',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Annuler',
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
