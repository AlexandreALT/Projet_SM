import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product.dart';

class ProductDB {

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<bool> addProduct(Product productData) async {
    await _db.collection("Produits").add(productData.toMap());
    return true;
  }

  CollectionReference _collectionReference =
  FirebaseFirestore.instance.collection('Produits');

  Future<List<Product>> getAllConsumable() async {
    var produits = await FirebaseFirestore.instance.collection('Produits').where("categorie", isEqualTo: "Consommable").get();
    return produits.docs.map((produit) => Product.fromDocumentSnapshot(produit)).toList();
  }

  Future<List<Product>> getAllProduct() async {
    var produits = await FirebaseFirestore.instance.collection('Produits').get();
    return produits.docs.map((produit) => Product.fromDocumentSnapshot(produit)).toList();
  }

  Future<List<Product>> getProductWhere(String condition, String value) async {
    var produits = await FirebaseFirestore.instance.collection('Produits').where(condition,isEqualTo: value).get();
    return produits.docs.map((produit) => Product.fromDocumentSnapshot(produit)).toList();
  }

  Future<int> countProducts(String condition, String value) async {
    var produits = await FirebaseFirestore.instance.collection('Produits').where(condition,isEqualTo: value).get();
    return produits.docs.map((produit) => Product.fromDocumentSnapshot(produit)).toList().length;
  }
}