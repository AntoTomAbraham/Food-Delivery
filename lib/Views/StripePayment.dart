import 'package:del_app/Providers/Payment.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaytmPayment extends StatefulWidget {
  @override
  _PaytmPaymentState createState() => _PaytmPaymentState();
}

class _PaytmPaymentState extends State<PaytmPayment> {
  Razorpay _razorpay;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  Future checkmeOutt() async {
    var options = {
      'key': 'rzp_test_vhHqhNyKRpNGVz',
      'amount': 50000, //in the smallest currency sub-unit.
      'name': 'Acme Corp.',
      'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
      'description': 'Fine T-Shirt',
      'timeout': 60, // in seconds
      'prefill': {'contact': '9123456789', 'email': 'gaurav.kumar@example.com'}
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString() +
          "This is the Error__________________________++__________________");
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Pay using Stripe!",
            style: TextStyle(fontSize: 80),
          ),
          FlatButton.icon(
            label: Text("Pay Now"),
            icon: Icon(
              EvaIcons.pantone,
              color: Colors.blue,
            ),
            onPressed: () async {
              await checkmeOutt().whenComplete(() =>
                  Provider.of<PaymentHelper>(context, listen: false)
                      .showCheckOutButtonmethod);
            },
          )
        ],
      ),
    );
  }
}
