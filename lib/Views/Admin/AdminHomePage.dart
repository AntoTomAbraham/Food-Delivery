import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:del_app/Views/Admin/Services/AdminDetailsHelper.dart';
import 'package:del_app/Views/Decider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatactBtn(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: appbar(context),
      body: Column(children: <Widget>[
        dateChips(context),
        orderData(context),
      ]),
    );
  }

  Widget appbar(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Decider(),
            )),
        child: Icon(Icons.arrow_back_ios, color: Colors.blue),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      title: Text(
        "Orders",
        style: GoogleFonts.sanchez(color: Colors.black),
      ),
    );
  }

  Widget dateChips(BuildContext context) {
    return Container(
      width: 500.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ActionChip(
              backgroundColor: Colors.black,
              label: Text(
                "Today",
                style: GoogleFonts.sanchez(color: Colors.white),
              ),
              onPressed: () {}),
          ActionChip(
              backgroundColor: Colors.black,
              label: Text(
                "This Week",
                style: GoogleFonts.sanchez(color: Colors.white),
              ),
              onPressed: () {}),
          ActionChip(
              backgroundColor: Colors.black,
              label: Text(
                "This Month",
                style: GoogleFonts.sanchez(color: Colors.white),
              ),
              onPressed: () {})
        ],
      ),
    );
  }

  Widget orderData(BuildContext context) {
    return SizedBox(
      height: 300.0,
      width: 400.0,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("adminCollections")
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
              children:
                  snapshot.data.docs.map((DocumentSnapshot documentSnapshot) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    child: ListTile(
                      onTap: () => Provider.of<AdminDetailsHelper>(context,
                              listen: false)
                          .detailSheet(context, documentSnapshot),
                      trailing: IconButton(
                          icon: Icon(Icons.settings), onPressed: null),
                      title: Text(
                        documentSnapshot.data()['name'],
                        style: TextStyle(fontSize: 14.0),
                      ),
                      subtitle: Text(
                        documentSnapshot.data()['location'],
                        style: TextStyle(fontSize: 14.0),
                      ),
                      leading: CircleAvatar(
                          radius: 25.0,
                          backgroundColor: Colors.transparent,
                          child:
                              Image.network(documentSnapshot.data()['image'])),
                    ),
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }

  Widget floatactBtn(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.check,
            color: Colors.blue,
            size: 50,
          ),
          onPressed: () {},
          color: Colors.blue,
        ),
        SizedBox(
          width: 50,
        ),
        IconButton(
          icon: Icon(
            Icons.cancel,
            color: Colors.blue,
            size: 50,
          ),
          onPressed: () {},
          color: Colors.blue,
        ),
      ],
    );
  }
}
