import 'package:cloud_firestore/cloud_firestore.dart';

class Repository {
  final db = FirebaseFirestore.instance;

  Future<void> addData(collection, data) async {
    await db.collection(collection).add(data);
  }

  Future<void> updateData(collection, id, data) async {
    await db.collection(collection).doc(id).update(data);
  }

  Future<void> deleteData(collection, id) async {
    await db.collection(collection).doc(id).delete();
  }

  Future<QuerySnapshot> getData(collection) async {
    return await db.collection(collection).get();
  }
}