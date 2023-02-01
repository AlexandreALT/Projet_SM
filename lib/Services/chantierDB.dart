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

  Future<void> deleteChantier(Chantier chantierData) async {
    return FirebaseFirestore.instance.collection('Chantiers').doc(chantierData.id).delete();
  }

  Future<void> updateChantier(String id, Chantier chantierdata) async {
    return FirebaseFirestore.instance.collection("Chantiers").doc(id).update(
        {
          "name" : chantierdata.name,
          "nameClient" : chantierdata.nameClient,
          "adresse" : chantierdata.adresse,
          "dateDebut" : chantierdata.dateDebut
        });
  }


}