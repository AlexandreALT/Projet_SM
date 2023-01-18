import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/chantier.dart';

class ChantierDB {

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<bool> addChantier(Chantier chantierData) async {
    await _db.collection("Chantiers").add(chantierData.toMap());
    return  true;
  }

}