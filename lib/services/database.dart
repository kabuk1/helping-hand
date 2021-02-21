import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference servicesCollection =
      Firestore.instance.collection('services');

  Future updateUserData(bool chat, bool errands, bool shopping) async {
    return await servicesCollection.document(uid).setData({
      'chat': true,
      'errands': true,
      'shopping': true,
    });
  }

  Stream<QuerySnapshot> get services {
    return servicesCollection.snapshots();
  }
}
