import 'package:cloud_firestore/cloud_firestore.dart';

class Historique {
  final String? id;
  final String chantier;
  final String date;
  final String statut;
  final String numSerieProduit;

  Historique({
    this.id,
    required this.chantier,
    required this.date,
    required this.statut,
    required this.numSerieProduit
  });

  Map<String, dynamic> toMap() {
    return {
      'chantier': chantier,
      'date': date,
      'statut': statut,
      'numSerieProduit': numSerieProduit
    };
  }

  Historique.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        chantier = doc.data()!["chantier"],
        date = doc.data()!["date"],
        statut = doc.data()!["statut"],
        numSerieProduit = doc.data()!["numSerieProduit"];
}