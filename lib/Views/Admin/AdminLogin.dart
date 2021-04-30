import 'package:del_app/Providers/google_sign_in.dart';
import 'package:del_app/Views/Admin/AdminHOmePage.dart';
import 'package:del_app/Views/homepage.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                                builder: (BuildContext context) =>
                                    AdminHomePage(),
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
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => AdminHomePage(),
                          ));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
