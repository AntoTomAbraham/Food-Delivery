import 'package:del_app/Providers/google_sign_in.dart';
import 'package:del_app/Views/homepage.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  Auth auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Center(
            child: Text(
              "Puttu kada",
              style: GoogleFonts.architectsDaughter(
                color: Colors.black,
                fontSize: 48,
              ),
            ),
          ),
          Center(
            child: OutlineButton.icon(
              icon: Icon(
                EvaIcons.google,
                color: Colors.blue,
              ),
              onPressed: () {
                Provider.of<Auth>(context, listen: false)
                    .googleSignIn()
                    .whenComplete(
                      () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => HomePage(),
                          )),
                    );
              },
              label: Text("Signin Using google"),
              shape: StadiumBorder(),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                child: Text("New here? create an account"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => HomePage(),
                      ));
                },
                child: Text("Login using email and password"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
