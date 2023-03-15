import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:projet_sm/Services/productDB.dart';
import 'package:projet_sm/Services/referenceDB.dart';
import 'package:projet_sm/models/product.dart';

class FormOthers extends StatelessWidget {
  FormOthers({Key? key, this.image, this.category}) : super(key: key);

  final image;
  final category;

  var refcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
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
        SizedBox(height: MediaQuery.of(context).size.height / 4),
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
                  var reference = refcontroller.text;

                  var ref = await ReferenceDB().getReference(reference);
                  var serie = ref["compteur"].toString() + ref["alias"];
                  await ReferenceDB().updateReference(
                      reference, 'compteur', ref["compteur"] + 1);

                  var imgPath = "Products/" +
                      ref["nom"] +
                      "/" +
                      ref["reference"] +
                      "/" +
                      serie +
                      ".jpg";

                  final storageRef =
                      FirebaseStorage.instance.ref().child(imgPath);
                  File file = File(image.path);
                  storageRef.putFile(file);

                  String jour = DateTime.now().day.toString();
                  String mois = DateTime.now().month.toString();
                  String annee = DateTime.now().year.toString();
                  if (mois.length < 2) mois = "0" + mois;
                  if (jour.length < 2) jour = "0" + jour;
                  String date = jour + '/' + mois + '/' + annee;
                  var product = new Product(
                      cout: ref["cout"],
                      categorie: category,
                      reference: reference,
                      image: imgPath,
                      date_ajout: date,
                      numeroSerie: serie,
                      statut: "En entrepôt");
                  await ProductDB().addTool(product);
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
      ]),
    );
  }
}
