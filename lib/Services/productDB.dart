import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product.dart';

class ProductDB {

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<bool> addTool(Product productData) async {
    await _db.collection("Produits").doc(productData.numeroSerie).set({
      "categorie" : productData.categorie,
      "date_ajout" : productData.date_ajout,
      "idChantier" : "",
      "image" : productData.image,
      "reference" : productData.reference,
      "statut" : productData.statut,
      "numeroSerie": productData.numeroSerie,
      "cout": productData.cout,
    });
    return true;
  }

  Future<bool> addConsumable(Product productData) async {
    await _db.collection("Produits").doc(productData.reference).set({
      "categorie" : productData.categorie,
      "quantite" : productData.quantite,
      "reference" : productData.reference,
      "cout": productData.cout,
    });
    return true;
  }

  Future<void> updateConsumable(Product productData) async {
    await _db.collection("Produits").doc(productData.reference).update({
      "quantite" : productData.quantite,
    });
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

  Future<Product> getProduct(ref) async {
    final docRef =
    await FirebaseFirestore.instance.collection('Produits').doc(ref);
    DocumentSnapshot doc = await docRef.get();
    final data = doc.data() as Map<String, dynamic>;
    return Product.fromMap(data);
  }

  Future<List<Product>> getProductWhere(String condition, String value) async {
    var produits = await FirebaseFirestore.instance.collection('Produits').where(condition,isEqualTo: value).get();
    return produits.docs.map((produit) => Product.fromDocumentSnapshot(produit)).toList();
  }

  Future<int> countProducts(String condition, String value) async {
    var produits = await FirebaseFirestore.instance.collection('Produits').where(condition,isEqualTo: value).get();
    return produits.docs.map((produit) => Product.fromDocumentSnapshot(produit)).toList().length;
  }

  Future<void> updateProduct(String numSerie, String chantierId) async {
    return FirebaseFirestore.instance.collection("Produits").doc(numSerie).update(
        {
          "idChantier" : chantierId,
          "statut" : "En chantier",
        }
    );
  }

  Future<void> retourProduct(String numSerie) async {
    return FirebaseFirestore.instance.collection("Produits").doc(numSerie).update(
        {
          "idChantier" : "",
          "statut" : "En entrepôt",
        }
    );
  }

}