import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/historique.dart';

class HistoriqueDB {

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<bool> addHistorique(Historique historiqueData) async {
    await _db.collection("Historiques").add(historiqueData.toMap());
    return true;
  }

  Future<List<Historique>> getAllHistorique() async {
    var historiques = await FirebaseFirestore.instance.collection('Historiques').get();
    return historiques.docs.map((historique) => Historique.fromDocumentSnapshot(historique)).toList();
  }



}