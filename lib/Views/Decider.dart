import 'package:del_app/Views/Admin/AdminLogin.dart';
import 'package:del_app/Views/Login.dart';
import 'package:del_app/Views/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Decider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(color: Colors.grey[300]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Puttu kada",
                  style: GoogleFonts.architectsDaughter(
                    color: Colors.black,
                    fontSize: 48,
                  ),
                ),
                Text(
                  "Who are you?",
                  style: GoogleFonts.abel(
                    color: Colors.black,
                    fontSize: 28,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    OutlineButton(
                      onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => AdminLogin(),
                          )),
                      child: Text("Admin"),
                    ),
                    OutlineButton(
                      onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => LoginPage(),
                          )),
                      child: Text("User"),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
