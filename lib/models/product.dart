import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String? id;
  final String? numeroSerie;
  final String name;
  final String categorie;
  final int quantite;
  final String reference;
  final String image;

  Product({
    this.id,
    this.numeroSerie,
    required this.name,
    required this.categorie,
    required this.quantite,
    required this.reference,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'categorie': categorie,
      'quantite': quantite,
      'reference': reference,
      'image': image,
    };
  }

  Product.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        name = doc.data()!["name"],
        numeroSerie = doc.data()!["numeroSerie"],
        categorie = doc.data()!["categorie"],
        quantite = doc.data()!["quantite"],
        reference = doc.data()!["reference"],
        image = doc.data()!["image"];
}
