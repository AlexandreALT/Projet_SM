import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projet_sm/models/category.dart';

class CategoryDB {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<bool> addCategory(Category categoryData) async {
    await _db.collection("Categories").add(categoryData.toMap());
    return true;
  }

  CollectionReference _collectionCategory =
  FirebaseFirestore.instance.collection('Categories');

  Future<List> getData() async {
    QuerySnapshot querySnapshot = await _collectionCategory.get();
    final List allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    return allData;
  }
}