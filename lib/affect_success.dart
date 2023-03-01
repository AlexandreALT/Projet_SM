import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projet_sm/models/product.dart';
import 'package:projet_sm/tools/menu.dart';
import 'package:projet_sm/tools/search_bar.dart';

class AffectSuccess extends StatelessWidget {
  const AffectSuccess({Key? key}) : super(key: key);

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
          "",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      drawer: Menu(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                const SizedBox(height: 20),
                Image.asset('assets/check.png',
                    height: 100.0, fit: BoxFit.cover),
                const SizedBox(height: 20),
                const Text(
                  'Outil affecté à un chantier avec succès',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 12),
            Column(
              children: <Widget>[
                Container(
                  height : 50,
                  width: MediaQuery.of(context).size.width-40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                    ),
                    onPressed: () async {
                      Navigator.pushNamed(context, '/manual_entry');
                    },
                    child: const Text(
                      'Saisir un autre produit',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 40),
                Container(
                  height : 50,
                  width: MediaQuery.of(context).size.width-40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                    ),
                    onPressed: () async {
                      //Navigator.pushNamed(context, '/manual_entry');
                    },
                    child: const Text(
                      "Voir l'historique des sorties",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 40),
                Container(
                  height : 50,
                  width: MediaQuery.of(context).size.width-40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                    ),
                    onPressed: () async {
                      Navigator.pushNamed(context, '/accueil');
                    },
                    child: const Text(
                      'Retour à l\'accueil',
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
