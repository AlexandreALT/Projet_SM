import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:projet_sm/Services/productDB.dart';
import 'package:projet_sm/Services/referenceDB.dart';
import 'package:projet_sm/models/product.dart';
import 'package:projet_sm/models/reference.dart' as refClass;

class FormOthers extends StatefulWidget {
  FormOthers({Key? key, this.category, this.image}) : super(key: key);

  final category;
  final image;

  @override
  State<FormOthers> createState() => _FormOthersState();
}

class _FormOthersState extends State<FormOthers> {
  String? newDropDownValue = "";
  var refcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cpt = 0;
    return FutureBuilder<List>(
        future: ReferenceDB().getAllReference(),
        builder: ((context, snapshot) {
          String? dropdownvalue = snapshot.data![0].fullReference;
          var newTool = new refClass.Reference(reference: "Nouvelle référence", fullReference: "Nouvelle référence");
          cpt += 1;
          if(newDropDownValue == "") newDropDownValue = dropdownvalue;
          if (cpt > 1) snapshot.data?.add(newTool);
          return Scaffold(
            body: ListView(children: [
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.4,
                  color: Color.fromRGBO(232, 232, 232, 1.0),
                  child: widget.image == null
                      ? IconButton(
                          icon: Icon(Icons.add_a_photo, color: Colors.black),
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, '/choice_picture');
                          },
                        )
                      : Image.file(
                          File(widget.image.path),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(232, 232, 232, 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 8, bottom: 8),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: newDropDownValue,
                      items: snapshot.data?.map((item) {
                        return DropdownMenuItem(
                            value: item.fullReference, child: Text(item.fullReference));
                      }).toList(),
                      onChanged: (var newValue) {
                        setState(() {
                          if(newValue == "Nouvelle référence") Navigator.pushNamed(context, "/add_reference");
                          else newDropDownValue = newValue as String?;
                        });
                      },
                      isExpanded: true,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 4.5),
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
                        var reference = newDropDownValue;

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
                        File file = File(widget.image.path);
                        storageRef.putFile(file);

                        String jour = DateTime.now().day.toString();
                        String mois = DateTime.now().month.toString();
                        String annee = DateTime.now().year.toString();
                        if (mois.length < 2) mois = "0" + mois;
                        if (jour.length < 2) jour = "0" + jour;
                        String date = jour + '/' + mois + '/' + annee;
                        var product = new Product(
                            cout: ref["cout"],
                            categorie: widget.category,
                            reference: reference!,
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
        }));
  }
}
