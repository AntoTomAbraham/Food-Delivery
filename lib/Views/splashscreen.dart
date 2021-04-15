import 'dart:async';

import 'package:del_app/Views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(
        seconds: 4,
      ),
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => HomePage(),
          )),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(
              "https://i.pinimg.com/736x/3f/d7/ba/3fd7ba030a197b0355acffe55ed18236.jpg",
            ),
            Text(
              "Puttu kada",
              style: GoogleFonts.architectsDaughter(
                color: Colors.black,
                fontSize: 48,
              ),
            )
          ],
        ),
      ),
    );
  }
}
