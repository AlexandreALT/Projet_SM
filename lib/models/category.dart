import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  final String? id;
  final String name;

  Category({
    this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  Category.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
    : id = doc.id,
      name = doc.data()!["name"];
}