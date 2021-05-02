import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:del_app/Views/Admin/Services/DeliveryOptions.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminDetailsHelper with ChangeNotifier {
  detailSheet(BuildContext context, DocumentSnapshot documentSnapshot) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Divider(thickness: 4),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(EvaIcons.person),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            documentSnapshot.data()['username'],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(EvaIcons.homeOutline),
                        Container(
                          constraints: BoxConstraints(maxWidth: 360.0),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              documentSnapshot.data()['location'],
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.directions_bike),
                          Container(
                            constraints: BoxConstraints(maxWidth: 360.0),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                documentSnapshot.data()['name'],
                              ),
                            ),
                          ),
                          CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.transparent,
                              child: Image.network(
                                  documentSnapshot.data()['image'])),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FlatButton.icon(
                      color: Colors.white,
                      onPressed: () {
                        Provider.of<DeliveryOption>(context, listen: false)
                            .managedOrderss(
                                context, documentSnapshot, "RejectedOrders");
                      },
                      icon: Icon(
                        EvaIcons.stopCircle,
                        color: Colors.blue,
                      ),
                      label: Text("Reject"),
                    ),
                    FlatButton.icon(
                      onPressed: () {
                        Provider.of<DeliveryOption>(context, listen: false)
                            .managedOrderss(
                                context, documentSnapshot, "DeliveredOrders");
                      },
                      color: Colors.white,
                      icon: Icon(
                        EvaIcons.car,
                        color: Colors.blue,
                      ),
                      label: Text("Deliver"),
                    ),
                    FlatButton.icon(
                      onPressed: null,
                      color: Colors.white,
                      icon: Icon(
                        EvaIcons.phone,
                        color: Colors.blue,
                      ),
                      label: Text("Contact Manager"),
                    ),
                  ],
                )
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.95,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white12,
            ),
          );
        });
  }
}
