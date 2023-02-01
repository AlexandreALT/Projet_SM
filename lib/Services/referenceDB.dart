import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projet_sm/models/reference.dart';

class ReferenceDB {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<bool> addReference(Reference referenceData) async {
    await _db
        .collection("References")
        .doc(referenceData.nom + " " + referenceData.reference)
        .set({
      'alias': referenceData.alias,
      'compteur': referenceData.compteur,
      'cout': referenceData.cout,
      'nom': referenceData.nom,
      'reference': referenceData.reference,
    });
    return true;
  }

  Future<void> updateReference(ref, key, value) async {
    await _db.collection("References").doc(ref).update({key: value});
  }

  CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('References');

  Future<List<Reference>> getAllReference() async {
    var references =
        await FirebaseFirestore.instance.collection('References').get();
    return references.docs
        .map((reference) => Reference.fromDocumentSnapshot(reference))
        .toList();
  }

  Future<Map<String, dynamic>> getReference(ref) async {
    final docRef =
        await FirebaseFirestore.instance.collection('References').doc(ref);
    DocumentSnapshot doc = await docRef.get();
    final data = doc.data() as Map<String, dynamic>;
    return data;
  }
}
