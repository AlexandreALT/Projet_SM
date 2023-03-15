import 'package:flutter/material.dart';
import 'package:projet_sm/chantiers/chantier_details.dart';

import '../models/historique.dart';

class HistoriqueWidget extends StatelessWidget {

  final Historique historique;

  const HistoriqueWidget({Key? key, required this.historique}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.blue,
          child: Padding(
            padding:
            const EdgeInsets.only(top: 5, right: 5, bottom: 5, left: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      historique.refProduit + " - ",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      historique.numSerieProduit,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
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
                      historique.chantier,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
