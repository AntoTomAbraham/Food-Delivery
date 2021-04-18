import 'package:del_app/Views/homepage.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            appbar(context),
            headerText(),
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
            padding: const EdgeInsets.only(left: 280.0),
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
      height: 280.0,
    );
  }

  Widget shippingdetails(String address, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey.shade500, blurRadius: 5, spreadRadius: 5)
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
                        child: Text("New Police area"))
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
                      constraints: BoxConstraints(maxWidth: 250.0),
                      child: Text(" 8am : 11am"))
                ],
              ),
              IconButton(icon: Icon(Icons.edit), onPressed: () {})
            ],
          )
        ],
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
        height: 95.0,
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
                      "39",
                      style: TextStyle(color: Colors.grey, fontSize: 16.0),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
