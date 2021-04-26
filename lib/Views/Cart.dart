import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:del_app/Providers/Payment.dart';
import 'package:del_app/Providers/google_sign_in.dart';
import 'package:del_app/Views/homepage.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  TextEditingController locationController = TextEditingController();
  TextEditingController timeBController = TextEditingController();
  TextEditingController timeAController = TextEditingController();
  Razorpay razorpay;
  int total = 49;

  @override
  void initState() {
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
        Provider.of<PaymentHelper>(context, listen: false).handlePaymentSucess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
        Provider.of<PaymentHelper>(context, listen: false).handlePaymentError);
    razorpay.on(
        Razorpay.EVENT_EXTERNAL_WALLET,
        Provider.of<PaymentHelper>(context, listen: false)
            .handleExternalWallet);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    razorpay.clear();
    super.dispose();
  }

  Future checkmeOut() async {
    var options = {
      'key': 'rzp_test_vhHqhNyKRpNGVz',
      'amount': total,
      'name': Provider.of<Auth>(context, listen: false).getemail,
      'description': 'payment',
      'prefill': {
        'contact': '99999999999',
        'email': Provider.of<Auth>(context, listen: false).getemail
      },
      'external': {
        'wallet': ['paytm']
      }
    };
    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString() +
          "This is the Error__________________________++__________________");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          appbar(context),
          headerText(),
          cartData(),
          amountData(),
          billingData(),
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
          onPressed: () async {
            await checkmeOut().whenComplete(() =>
                Provider.of<PaymentHelper>(context, listen: false)
                    .showCheckOutButtonmethod);
          },
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
                height: 180,
                child: new ListView(
                  scrollDirection: Axis.horizontal,
                  children: snapshot.data.docs
                      .map((DocumentSnapshot documentsnapshot) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
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
                              child: Image.network(
                                  documentsnapshot.data()['image']),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: 20),
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
                                )),
                                Provider.of<PaymentHelper>(context,
                                                listen: false)
                                            .showCheckOutButton ==
                                        true
                                    ? Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(
                                          width: 150,
                                          height: 30,
                                          child: FlatButton(
                                            textColor: Colors.black,
                                            onPressed: () async {
                                              await FirebaseFirestore.instance
                                                  .collection(
                                                      'adminCollections')
                                                  .add({
                                                'username': Provider.of<Auth>(
                                                        context,
                                                        listen: false)
                                                    .getemail,
                                                'name': documentsnapshot
                                                    .data()['name'],
                                                'price': documentsnapshot
                                                    .data()['price'],
                                                'time':
                                                    Provider.of<PaymentHelper>(
                                                            context,
                                                            listen: false)
                                                        .deliveryTiming
                                                        .format(context),
                                                'location': locationController
                                              });
                                            },
                                            child: Text(
                                              "Place Order",
                                            ),
                                            color: Colors.red[300],
                                          ),
                                        ),
                                      )
                                    : Container()
                              ],
                            )
                          ],
                        ),
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

  Widget billingData() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: 400,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextField(
                  controller: locationController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your location',
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(child: Text("Delivery from:")),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(EvaIcons.clock),
                  onPressed: () =>
                      Provider.of<PaymentHelper>(context, listen: false)
                          .selectTime(context),
                ),
                SizedBox(
                  width: 100,
                  child: TextField(
                      controller: timeAController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'From',
                      )),
                ),
                SizedBox(
                  width: 100,
                  child: TextField(
                      controller: timeAController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'To',
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget amountData() {
    return Container(
        height: 200,
        width: 400,
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
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[Text("Total amount :"), Text("Rs 299")],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[Text("Delivery charge :"), Text("Rs 49")],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[Text("Selling price :"), Text("Rs 348")],
              )
            ]));
  }

  placeOrder(BuildContext context, DocumentSnapshot documentsnapshot) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              child: Column(
                children: <Widget>[
                  Divider(thickness: 4),
                ],
              ),
              height: MediaQuery.of(context).size.height * .4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ));
        });
  }
}
