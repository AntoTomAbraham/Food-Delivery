import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:del_app/Views/homepage.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  final TextEditingController locationcontroller = TextEditingController();
  final TextEditingController timeacontroller = TextEditingController();
  final TextEditingController timebcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatinActionButton(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            appbar(context),
            headerText(),
            //SizedBox(height: 20),
            cartData(),
            shippingdetails("Thachampara", context),
            billingData(),
          ],
        ),
      ),
    );
  }

  Widget appbar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
              icon: Icon(EvaIcons.arrowBack),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomePage()));
              }),
          Padding(
            padding: const EdgeInsets.only(left: 200.0),
            child: IconButton(
              icon: Icon(
                EvaIcons.trash2Outline,
                color: Colors.red,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  Widget headerText() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Your",
            style: TextStyle(color: Colors.grey, fontSize: 24.0),
          ),
          Text(
            "Cart",
            style: TextStyle(
                color: Colors.black,
                fontSize: 44.0,
                fontWeight: FontWeight.bold),
          )
        ]);
  }

  Widget cartData() {
    return SizedBox(
      height: 260.0,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('myOrders').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              child: Image.network(
                "https://tse3.mm.bing.net/th?id=OIP.ixrIL01VXJFnaBin_oqH0QHaFj&pid=Api&P=0&w=229&h=173",
              ),
            );
          } else {
            return Container(
              height: 220,
              child: new ListView(
                children:
                    snapshot.data.docs.map((DocumentSnapshot documentsnapshot) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade500,
                            blurRadius: 5,
                            spreadRadius: 3,
                          )
                        ]),
                    height: 200,
                    width: 400,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 200,
                          child:
                              Image.network(documentsnapshot.data()['image']),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              documentsnapshot.data()['name'],
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              'Price: ${documentsnapshot.data()['price'].toString()}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              'Beacon: ${documentsnapshot.data()['beacon'].toString()}',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              'Cheese: ${documentsnapshot.data()['cheese'].toString()}',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              'Onion: ${documentsnapshot.data()['onion'].toString()}',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16.0,
                              ),
                            ),
                            CircleAvatar(
                                child: Text(
                              documentsnapshot.data()['size'],
                              style: TextStyle(color: Colors.white),
                            ))
                          ],
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget shippingdetails(String address, BuildContext context) {
    return GestureDetector(
      onTap: () {
        detailSheet(context);
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade500, blurRadius: 5, spreadRadius: 5)
          ],
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
        ),
        height: 105,
        width: 400,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Icon(Icons.location_on),
                      Container(
                        constraints: BoxConstraints(maxWidth: 250.0),
                        child: TextField(
                          controller: locationcontroller,
                        ),
                      )
                    ],
                  ),
                  IconButton(icon: Icon(Icons.edit), onPressed: () {})
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(EvaIcons.clock),
                    Container(
                        height: 50.0,
                        constraints: BoxConstraints(maxWidth: 250.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextField(
                              controller: timeacontroller,
                            ),
                            Text(":"),
                            TextField(
                              controller: timebcontroller,
                            ),
                          ],
                        ))
                  ],
                ),
                IconButton(icon: Icon(Icons.edit), onPressed: () {})
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget billingData() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade500, blurRadius: 5, spreadRadius: 5)
          ],
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
        ),
        height: 100.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Subtotal",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.monetization_on,
                      color: Colors.grey,
                      size: 16.0,
                    ),
                    Text(
                      "249",
                      style: TextStyle(color: Colors.grey, fontSize: 16.0),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Delivery charges",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.monetization_on,
                      color: Colors.grey,
                      size: 16.0,
                    ),
                    Text(
                      "49",
                      style: TextStyle(color: Colors.grey, fontSize: 16.0),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Grand Total",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.monetization_on,
                      color: Colors.yellow,
                      size: 18.0,
                    ),
                    Text(
                      "280",
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget floatinActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        GestureDetector(
            child: Container(
          width: 250,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.red.shade500,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              "Place Order",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
            ),
          ),
        )),
      ],
    );
  }

  detailSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return new Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter Location",
                        hintStyle: TextStyle(color: Colors.orange),
                      ),
                      controller: locationcontroller,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "you'r available from",
                        hintStyle: TextStyle(color: Colors.orange),
                      ),
                      controller: timeacontroller,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "to",
                        hintStyle: TextStyle(color: Colors.orange),
                      ),
                      controller: timebcontroller,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  MaterialButton(
                      color: Colors.orange,
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {})
                ],
              ),
            ),
          );
        });
  }
}
