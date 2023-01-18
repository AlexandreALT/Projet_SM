import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product.dart';

class ProductDB {

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<bool> addProduct(Product productData) async {
    await _db.collection("Produits").add(productData.toMap());
    return  true;
  }

  CollectionReference _collectionReference =
  FirebaseFirestore.instance.collection('Produits');

  Future<List> getData() async {
    QuerySnapshot querySnapshot = await _collectionReference.get();
    final List allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    return allData;
  }

}