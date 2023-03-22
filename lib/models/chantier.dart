import 'package:cloud_firestore/cloud_firestore.dart';

class Chantier {
  final String? id ;
  final String name;
  final String nameClient;
  final String dateDebut;
  final String adresse;

  Chantier({
    this.id,
    required this.name,
    required this.nameClient,
    required this.dateDebut,
    required this.adresse
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'nameClient' : nameClient,
      'dateDebut' : dateDebut,
      'adresse' : adresse
    };
  }

  Chantier.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        name = doc.data()!["name"],
        nameClient = doc.data()!["nameClient"],
        dateDebut = doc.data()!["dateDebut"],
        adresse = doc.data()!["adresse"];


  factory Chantier.fromMap(Map<String, dynamic> data) {
    return Chantier(
      id: data['id'],
      name: data['name'],
      nameClient: data['nameClient'],
      dateDebut: data['dateDebut'],
      adresse: data['adresse'],
    );
  }



}