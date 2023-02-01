import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projet_sm/models/product.dart';
import 'package:projet_sm/tools/menu.dart';
import 'package:projet_sm/tools/search_bar.dart';

class ScanResult extends StatelessWidget {
  const ScanResult({Key? key}) : super(key: key);

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
          "Résultat de la recherche",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      drawer: Menu(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 500,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      'Burineur SDS Max MH 5',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text('N° Série : 1234BUR', style: TextStyle(fontSize: 20)),
                    //Image.file(
                      //File(product.image),
                    //),
                  ],
                ),
              ),
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
                      //Navigator.pushNamed(context, '/choice_capture');
                    },
                    child: const Text(
                      'Affecter à un chantier',
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
                      //Navigator.pushNamed(context, '/choice_capture');
                    },
                    child: const Text(
                      'Retour de produit',
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
                      Navigator.pushNamed(context, '/choice_capture');
                    },
                    child: const Text(
                      'Re-scanner',
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
                      backgroundColor: Colors.blue,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                    ),
                    onPressed: () {
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
