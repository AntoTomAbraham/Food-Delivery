import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: Column(
        children: <Widget>[
          dateChips(context),
        ],
      ),
    );
  }

  Widget appbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      title: Text(
        "Orders",
        style: GoogleFonts.modak(color: Colors.black),
      ),
    );
  }

  Widget dateChips(BuildContext context) {
    return Positioned(
      top: 120.0,
      child: Container(
        color: Colors.black,
        width: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ActionChip(
                backgroundColor: Colors.black,
                label: Text(
                  "Today",
                  style: GoogleFonts.modak(color: Colors.white),
                ),
                onPressed: () {}),
            ActionChip(
                backgroundColor: Colors.black,
                label: Text(
                  "This Week",
                  style: GoogleFonts.modak(color: Colors.white),
                ),
                onPressed: () {}),
            ActionChip(
                backgroundColor: Colors.black,
                label: Text(
                  "This Month",
                  style: GoogleFonts.modak(color: Colors.white),
                ),
                onPressed: () {})
          ],
        ),
      ),
    );
  }

  Widget orderData(BuildContext context) {
    return Positioned(top: 200.0, child: null);
  }
}
