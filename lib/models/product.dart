import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String? id;
  final String? numeroSerie;
  final String categorie;
  final int quantite;
  final String reference;
  final String image;
  final String date_ajout;
  final String statut;

  Product({
    this.id,
    this.numeroSerie,
    required this.categorie,
    required this.quantite,
    required this.reference,
    required this.image,
    required this.date_ajout,
    required this.statut,
  });

  Map<String, dynamic> toMap() {
    return {
      'categorie': categorie,
      'quantite': quantite,
      'reference': reference,
      'image': image,
      'date_ajout': date_ajout,
      'statut': statut,
      'numeroSerie': numeroSerie,
    };
  }

  Product.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        numeroSerie = doc.data()!["numeroSerie"],
        categorie = doc.data()!["categorie"],
        quantite = doc.data()!["quantite"],
        reference = doc.data()!["reference"],
        image = doc.data()!["image"],
        date_ajout = doc.data()!["date_ajout"],
        statut = doc.data()!["statut"];
}
