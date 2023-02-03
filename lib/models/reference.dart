import 'package:cloud_firestore/cloud_firestore.dart';

class Reference {
  final String? id;
  final String? alias;
  final int? compteur;
  final int? cout;
  final String? nom;
  final String reference;

  Reference({
    this.id,
    this.alias,
    this.compteur,
    this.cout,
    this.nom,
    required this.reference,
  });

  Map<String, dynamic> toMap() {
    return {
      'alias': alias,
      'compteur': compteur,
      'cout': cout,
      'nom': nom,
      'reference': reference,
    };
  }

  Reference.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        alias = doc.data()!["alias"],
        compteur = doc.data()!["compteur"],
        cout = doc.data()!["cout"],
        nom = doc.data()!["nom"],
        reference = doc.data()!["reference"];
}
