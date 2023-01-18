import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product.dart';

class ProductDB {

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<bool> addProduct(Product productData) async {
    await _db.collection("Produits").add(productData.toMap());
    return  true;
  }

}