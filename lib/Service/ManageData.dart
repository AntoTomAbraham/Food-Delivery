import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:del_app/Providers/Authentication.dart';
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

  //Future submitData() async {
  //return FirebaseFirestore.instance.collection('myOrders').doc(Provider.of<Authentication>(context,listen: false).getuid;)
  //}
}
