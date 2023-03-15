import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:projet_sm/Services/productDB.dart';
import 'package:projet_sm/models/product.dart';
import 'package:projet_sm/tools/menu.dart';
import 'package:projet_sm/tools/search_bar.dart';

import 'Services/historiqueDB.dart';
import 'affect_site.dart';
import 'models/historique.dart';

class ScanResult extends StatelessWidget {
  const ScanResult({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseStorage.instance.ref().child(product.image);
    return FutureBuilder<String>(
        future: ref.getDownloadURL(),
        builder: (context, snapshot) {
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
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            product.reference,
                            style: TextStyle(fontSize: 25),
                          ),
                          Text(product!.numeroSerie!,
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                  snapshot.data == null
                      ? Text('Aucune image pour ce produit')
                      : Image.network(
                          snapshot.data!,
                          height: MediaQuery.of(context).size.height / 2,
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: <Widget>[
                      if (product.statut == "En entrepôt")
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width - 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                              ),
                            ),
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AffectSite(produit: product)));
                            },
                            child: const Text(
                              'Affecter à un chantier',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      if (product.statut == "En chantier")
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width - 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                              ),
                            ),
                            onPressed: () async {
                              ProductDB().retourProduct(product.numeroSerie!);
                              String statut = product.idChantier != null ? "Entré" : "Sortie";
                              String dateNow = new DateTime.now().toString();
                              Historique historiqueData = new Historique(chantier: product.idChantier!, date: dateNow, statut: statut, numSerieProduit: product.numeroSerie!, refProduit: product.reference);
                              HistoriqueDB().addHistorique(historiqueData);
                              Navigator.pushNamed(context, '/retour_success');
                            },
                            child: const Text(
                              'Retour de produit',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      SizedBox(height: MediaQuery.of(context).size.height / 40),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
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
                        height: 50,
                        width: MediaQuery.of(context).size.width - 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
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
        });
  }
}
