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

  Future<List> getData() async {
    QuerySnapshot querySnapshot = await _collectionReference.get();
    final List allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    return allData;
  }
}
