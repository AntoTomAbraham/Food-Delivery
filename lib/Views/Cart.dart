import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:del_app/Views/homepage.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          appbar(context),
          headerText(),
          cartData(),
          btn(),
        ],
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
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
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
          ]),
    );
  }

  Widget btn() {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Container(
        width: 20,
        child: FlatButton(
          textColor: Colors.black,
          onPressed: () {},
          child: Text(
            "Order now",
          ),
          color: Colors.red[300],
        ),
      ),
    );
  }

  Widget cartData() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        height: 220.0,
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
                  scrollDirection: Axis.horizontal,
                  children: snapshot.data.docs
                      .map((DocumentSnapshot documentsnapshot) {
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
      ),
    );
  }
}
