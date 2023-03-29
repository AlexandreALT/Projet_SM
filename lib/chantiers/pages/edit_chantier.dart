import 'package:flutter/material.dart';
import 'package:projet_sm/Services/chantierDB.dart';
import 'package:projet_sm/models/chantier.dart';
import 'package:projet_sm/tools/menu.dart';

import 'chantier_details.dart';

class EditChantier extends StatelessWidget {
  final Chantier chantier;
  final String id;

  EditChantier({Key? key, required this.id, required this.chantier})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController(text: chantier.name);
    var nameClientController = TextEditingController(text: chantier.nameClient);
    var adresseController = TextEditingController(text: chantier.adresse);
    var dateDebutController = TextEditingController(text: chantier.dateDebut);

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
          "Modifier le chantier",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      drawer: Menu(),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 15),
            TextFormField(
              controller: nameController,
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(232, 232, 232, 1.0),
                  hintText: chantier.name,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {},
                  )),
            ),
            SizedBox(height: 15),
            Text('Nom du client :',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            SizedBox(height: 5),
            TextFormField(
              controller: nameClientController,
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
                hintText: chantier.nameClient,
              ),
            ),
            SizedBox(height: 15),
            Text('Adresse :',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            SizedBox(height: 5),
            TextFormField(
              controller: adresseController,
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
                hintText: chantier.adresse,
              ),
            ),
            SizedBox(height: 15),
            Text('Date de début :',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            SizedBox(height: 5),
            TextFormField(
              controller: dateDebutController,
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
                  hintText: chantier.dateDebut,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_month),
                    onPressed: () {},
                  )),
            ),
            SizedBox(height: 15),
            Text('Date de fin :',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            SizedBox(height: 5),
            TextFormField(
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
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_month),
                    onPressed: () {},
                  )),
            ),
            SizedBox(height: 25),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                  ),
                  onPressed: () {
                    var updateChantier = new Chantier(
                        name: nameController.text,
                        nameClient: nameClientController.text,
                        adresse: adresseController.text,
                        dateDebut: dateDebutController.text);
                    ChantierDB().updateChantier(chantier.id!, updateChantier);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ChantierDetails(chantier: updateChantier)));
                  },
                  child: const Text(
                    'Valider',
                    style: TextStyle(fontSize: 20),
                  ),
                )),
            SizedBox(height: 20),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                )),
          ],
        ),
      ),
    );
  }
}
