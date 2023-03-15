import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projet_sm/Services/historiqueDB.dart';
import 'package:projet_sm/Services/productDB.dart';
import 'package:projet_sm/models/historique.dart';
import 'package:projet_sm/models/product.dart';
import 'package:projet_sm/tools/menu.dart';
import 'package:projet_sm/tools/search_bar.dart';

import 'chantiers/chantierListWidget.dart';
import 'chantiers/selectChantierListWidget.dart';

class AffectSite extends StatefulWidget {
  const AffectSite({Key? key, required this.produit}) : super(key: key);

  final Product produit;

  @override
  _AffectSiteState createState() => _AffectSiteState();
}

class _AffectSiteState extends State<AffectSite> {
  String _selectedChantierId = "G1hXzdM4Ti5AfXRpMnIk";

  void _onChantierChanged(String? value) {
    setState(() {
      _selectedChantierId = value ?? "G1hXzdM4Ti5AfXRpMnIk";
    });
  }

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
                      widget.produit.reference,
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(widget.produit.numeroSerie!,
                        style: TextStyle(fontSize: 20)),
                    //Image.file(
                    //File(product.image),
                    //),
                    SizedBox(height: 40),
                    Text(
                      'Sélectionner un chantier',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: SelectChantierListWidget(
                        onChanged: _onChantierChanged,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(50.0)),
                      ),
                    ),
                    onPressed: () {
                      ProductDB().updateProduct(widget.produit.numeroSerie!, _selectedChantierId);
                      String statut = widget.produit.idChantier != null ? "Entré" : "Sortie";
                      String dateNow = new DateTime.now().toString();
                      Historique historiqueData = new Historique(chantier: _selectedChantierId, date: dateNow, statut: statut, numSerieProduit: widget.produit.numeroSerie!, refProduit: widget.produit.reference);
                      HistoriqueDB().addHistorique(historiqueData);
                      Navigator.pushNamed(context, '/affect_success');
                    },
                    child: const Text(
                      'Valider',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
