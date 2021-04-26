import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:del_app/Views/Cart.dart';
import 'package:del_app/Views/homepage.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:del_app/Providers/Calculation.dart';

class DetailScreen extends StatefulWidget {
  final QueryDocumentSnapshot queryDocumentSnapshot;
  DetailScreen({this.queryDocumentSnapshot});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int cheeseValue = 0;
  int garnish = 0;
  int nuts = 0;
  int cartItems = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: floatinActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          appbar(context),
          foodImage(),
          middleData(),
          SizedBox(height: 20),
          footerDetails(),
        ],
      ),
    );
  }

  Widget appbar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
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
              onPressed: () {
                Provider.of<Calculation>(context, listen: false)
                    .removeAllData();
              },
            ),
          )
        ],
      ),
    );
  }

  Widget foodImage() {
    return Center(
      child: SizedBox(
        height: 200.0,
        child: Container(
          child: Image.network(widget.queryDocumentSnapshot['image']),
          decoration: BoxDecoration(shape: BoxShape.circle),
        ),
      ),
    );
  }

  Widget middleData() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.star,
                color: Colors.yellow.shade700,
                size: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  widget.queryDocumentSnapshot['ratings'],
                  style: TextStyle(fontSize: 20.0, color: Colors.grey.shade500),
                ),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              constraints: BoxConstraints(maxWidth: 500),
              child: Text(
                widget.queryDocumentSnapshot['name'],
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.monetization_on,
                  size: 20.0,
                  color: Colors.cyan,
                ),
                Text(
                  widget.queryDocumentSnapshot['price'].toString(),
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget footerDetails() {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: SizedBox(
        height: 300.0,
        child: Stack(
          children: <Widget>[
            Container(
              height: 300.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500,
                      blurRadius: 5,
                      spreadRadius: 3,
                    )
                  ]),
              width: 400,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, right: 20, left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text(
                        "Add more Stuff",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'cheese',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 20.0,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(
                                    EvaIcons.minusCircle,
                                    color: Colors.cyan,
                                  ),
                                  onPressed: () {
                                    Provider.of<Calculation>(context,
                                            listen: false)
                                        .minusCheese();
                                  }),
                              Text(
                                Provider.of<Calculation>(context, listen: true)
                                    .getcheeseValue
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              IconButton(
                                  icon: Icon(
                                    EvaIcons.plusCircle,
                                    color: Colors.cyan,
                                  ),
                                  onPressed: () {
                                    Provider.of<Calculation>(context,
                                            listen: false)
                                        .addCheese();
                                  }),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Onion',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 20.0,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(
                                    EvaIcons.minusCircle,
                                    color: Colors.cyan,
                                  ),
                                  onPressed: () {
                                    Provider.of<Calculation>(context,
                                            listen: false)
                                        .minusOnion();
                                  }),
                              Text(
                                Provider.of<Calculation>(context, listen: true)
                                    .getOnionValue
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              IconButton(
                                  icon: Icon(
                                    EvaIcons.plusCircle,
                                    color: Colors.cyan,
                                  ),
                                  onPressed: () {
                                    Provider.of<Calculation>(context,
                                            listen: false)
                                        .addonion();
                                  }),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'beacon',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 20.0,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(
                                    EvaIcons.minusCircle,
                                    color: Colors.cyan,
                                  ),
                                  onPressed: () {
                                    Provider.of<Calculation>(context,
                                            listen: false)
                                        .minusbeacon();
                                  }),
                              Text(
                                Provider.of<Calculation>(context, listen: false)
                                    .getbeaconValue
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              IconButton(
                                  icon: Icon(
                                    EvaIcons.plusCircle,
                                    color: Colors.cyan,
                                  ),
                                  onPressed: () {
                                    Provider.of<Calculation>(context,
                                            listen: false)
                                        .addbeacon();
                                  }),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Provider.of<Calculation>(context, listen: false)
                        .selectSmallSize();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Provider.of<Calculation>(context, listen: true)
                              .smallTapped
                          ? Colors.red.shade100
                          : Colors.white,
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "S",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Provider.of<Calculation>(context, listen: false)
                        .selectMediumSize();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Provider.of<Calculation>(context, listen: true)
                              .mediumTapped
                          ? Colors.red.shade100
                          : Colors.white,
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "M",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Provider.of<Calculation>(context, listen: false)
                        .selectLargeSize();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Provider.of<Calculation>(context, listen: true)
                              .largeTapped
                          ? Colors.red.shade100
                          : Colors.white,
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "L",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                )
              ],
            )
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
            onTap: () {
              Provider.of<Calculation>(context, listen: false)
                  .addToCart(context, {
                'image': widget.queryDocumentSnapshot['image'],
                'name': widget.queryDocumentSnapshot['name'],
                'price': widget.queryDocumentSnapshot['price'],
                'onion': Provider.of<Calculation>(context, listen: false)
                    .getOnionValue,
                'beacon': Provider.of<Calculation>(context, listen: false)
                    .getbeaconValue,
                'cheese': Provider.of<Calculation>(context, listen: false)
                    .getcheeseValue,
                'size':
                    Provider.of<Calculation>(context, listen: false).getsize,
              });
            },
            child: Container(
              width: 250,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.red.shade500,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  "Add to cart",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                ),
              ),
            )),
        Stack(children: [
          FloatingActionButton(
            backgroundColor: Colors.red.shade500,
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext context) => Cart()));
            },
            child: Icon(
              EvaIcons.shoppingBagOutline,
              color: Colors.black,
            ),
          ),
          Positioned(
            left: 35,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.red.shade400,
              child: Text(
                Provider.of<Calculation>(context, listen: true)
                    .getCartData
                    .toString(),
              ),
            ),
          )
        ])
      ],
    );
  }
}
