import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/historique.dart';

class HistoriqueDB {

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<bool> addHistorique(Historique historiqueData) async {
    await _db.collection("Categories").add(historiqueData.toMap());
    return true;
  }



}