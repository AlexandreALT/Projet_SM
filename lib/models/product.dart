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
  final int cout;
  final String? idChantier;

  Product({
    this.id,
    this.numeroSerie,
    required this.categorie,
    required this.quantite,
    required this.reference,
    required this.image,
    required this.date_ajout,
    required this.statut,
    required this.cout,
    this.idChantier,
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
      'cout': cout,
      'idChantier': idChantier,
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
        statut = doc.data()!["statut"],
        cout = doc.data()!["cout"],
        idChantier = doc.data()!["idChantier"];

  factory Product.fromMap(Map<String, dynamic> data) {
    return Product(
      numeroSerie: data['numeroSerie'],
      categorie: data['categorie'],
      quantite: data['quantite'],
      reference: data['reference'],
      image: data['image'],
      date_ajout: data['date_ajout'],
      statut: data['statut'],
      cout: data['cout'],
      idChantier: data['idChantier'],
    );
  }
}
