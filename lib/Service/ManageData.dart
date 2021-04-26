import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:del_app/Providers/Authentication.dart';
import 'package:del_app/Providers/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ManageData extends ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future fetchData(String collection) async {
    QuerySnapshot querySnapshot =
        await firebaseFirestore.collection(collection).get();
    return querySnapshot.docs;
  }

  Future submitData(BuildContext context, dynamic data) async {
    return FirebaseFirestore.instance
        .collection('myOrders')
        .doc(Provider.of<Auth>(context, listen: false).getuid)
        .set(data);
  }

  Future deleteData(BuildContext context) async {
    return FirebaseFirestore.instance
        .collection('myOrders')
        .doc(Provider.of<Auth>(context, listen: false).getuid)
        .delete();
  }
}
