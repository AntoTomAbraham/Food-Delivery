import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class DeliveryOption with ChangeNotifier {
  showOrders(BuildContext context, String collection) {
    return showModalBottomSheet(
        context: null,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * .5,
            width: MediaQuery.of(context).size.width,
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection(collection)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Image.network(
                        "https://tse3.mm.bing.net/th?id=OIP.ixrIL01VXJFnaBin_oqH0QHaFj&pid=Api&P=0&w=229&h=173",
                      ),
                    );
                  } else {
                    return new ListView(
                        children: snapshot.data.docs
                            .map((DocumentSnapshot documentSnapshot) {
                      return ListTile(
                        subtitle: Text(documentSnapshot.data()['name']),
                        title: Text(documentSnapshot.data()['location']),
                        trailing: Icon(EvaIcons.map),
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(documentSnapshot.data()['image']),
                        ),
                      );
                    }).toList());
                  }
                }),
          );
        });
  }

  Future managedOrderss(BuildContext context, DocumentSnapshot documentsnapshot,
      String collectionname) async {
    return FirebaseFirestore.instance.collection(collectionname).add({
      'image': documentsnapshot.data()['image'],
      'name': documentsnapshot.data()['name'],
      'username': documentsnapshot.data()['username'],
      'total': documentsnapshot.data()['total'],
      'location': documentsnapshot.data()['location'],
    }).whenComplete(() => showMessage(context, collectionname));
  }

  showMessage(BuildContext context, String message) {
    return showBottomSheet(
        context: null,
        builder: (context) {
          return Container(
            height: 50.0,
            width: 400.0,
            child: Center(
              child: Text(message),
            ),
          );
        });
  }
}
