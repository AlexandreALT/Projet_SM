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
            child: Row(
              children: [
                Text(
                  historique.refProduit,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(
                  historique.numSerieProduit,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Spacer(),
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
        ),
        SizedBox(height: 15,)
      ],
    );
  }
}
