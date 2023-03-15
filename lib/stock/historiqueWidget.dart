import 'package:flutter/material.dart';
import 'package:projet_sm/chantiers/chantier_details.dart';

import '../models/chantier.dart';
import '../models/historique.dart';

class HistoriqueWidget extends StatelessWidget {

  final Historique historique;
  final Chantier chantier;

  const HistoriqueWidget({Key? key, required this.historique, required this.chantier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: historique.statut == 'Sortie' ? Colors.red : Colors.blue,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Padding(
            padding:
            const EdgeInsets.only(top: 5, right: 5, bottom: 5, left: 15),
            child: Row(
              children: [
                Column(
                  children: [
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          historique.refProduit,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        if(historique.refProduit != historique.numSerieProduit)
                          Text(" - " +
                            historique.numSerieProduit,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          historique.date,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          chantier.name,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                  ],
                ),
                if(historique.quantite != null)
                  Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            historique.quantite.toString(),
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
                          ),
                        ),
                      )
                    ],
                  )
              ],
            ),
          ),
        ),
        SizedBox(height: 15,)
      ],
    );
  }
}
