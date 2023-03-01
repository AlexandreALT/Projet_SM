import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projet_sm/models/product.dart';
import 'package:projet_sm/tools/menu.dart';
import 'package:projet_sm/tools/search_bar.dart';

import 'chantiers/chantierListWidget.dart';

class AffectSite extends StatelessWidget {
  const AffectSite({Key? key}) : super(key: key);

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
          "Affecter à un chantier",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      drawer: Menu(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 230,
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
                    SizedBox(height: 40),
                    Text(
                      'Sélectionner un chantier',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                        child: ChantierListWidget()
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  height : 50,
                  width: MediaQuery.of(context).size.width/2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/affect_success');
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
