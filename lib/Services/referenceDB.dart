import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projet_sm/models/reference.dart';

class ReferenceDB {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<bool> addReference(Reference referenceData) async {
    await _db.collection("References").add(referenceData.toMap());
    return true;
  }

  CollectionReference _collectionReference =
  FirebaseFirestore.instance.collection('References');

  Future<List<Reference>> getAllReference() async {
    var references = await FirebaseFirestore.instance.collection('References').get();
    return references.docs.map((reference) => Reference.fromDocumentSnapshot(reference)).toList();
  }
}
