import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/chantier.dart';

class ChantierDB {

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final CollectionReference _collectionRef = FirebaseFirestore.instance.collection('Chantiers');

  Future<bool> addChantier(Chantier chantierData) async {
    await _db.collection("Chantiers").add(chantierData.toMap());
    return  true;
  }

  Future<List<Chantier>> getAllChantier() async {
    var chantiers = await FirebaseFirestore.instance.collection('Chantiers').get();
    return chantiers.docs.map((chantier) => Chantier.fromDocumentSnapshot(chantier)).toList();
  }
}