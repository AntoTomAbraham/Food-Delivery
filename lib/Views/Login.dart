import 'package:del_app/Providers/Authentication.dart';
import 'package:del_app/Providers/google_sign_in.dart';
import 'package:del_app/Views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white24),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
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
              Padding(
                padding: const EdgeInsets.only(left: 78.00),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MaterialButton(
                      color: Colors.orange,
                      onPressed: () {
                        loginSheet(context);
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    MaterialButton(
                      color: Colors.orange,
                      onPressed: () {
                        //   Provider.of<GoogleSignInProvider>(context,
                        //           listen: false)
                        //       .login()
                        //       .whenComplete(
                        //         () => Navigator.pushReplacement(
                        //           context,
                        //           MaterialPageRoute(
                        //             builder: (BuildContext context) => HomePage(),
                        //           ),
                        //         ),
                        //       );
                      },
                      child: Text(
                        "Signup",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Text(
                        "Signin",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  loginSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return new Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter Email",
                        hintStyle: TextStyle(color: Colors.orange),
                      ),
                      controller: emailcontroller,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        hintStyle: TextStyle(color: Colors.orange),
                      ),
                      controller: passwordcontroller,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  MaterialButton(
                    color: Colors.orange,
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () =>
                        Provider.of<Authentication>(context, listen: false)
                            .loginIntoAccount(
                              emailcontroller.text,
                              passwordcontroller.text,
                            )
                            .whenComplete(
                              () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => HomePage(),
                                ),
                              ),
                            ),
                  )
                ],
              ),
            ),
          );
        });
  }

  signupSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return new Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter Email",
                        hintStyle: TextStyle(color: Colors.orange),
                      ),
                      controller: emailcontroller,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        hintStyle: TextStyle(color: Colors.orange),
                      ),
                      controller: passwordcontroller,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  MaterialButton(
                    color: Colors.orange,
                    child: Text(
                      "Signup",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () =>
                        Provider.of<Authentication>(context, listen: false)
                            .loginIntoAccount(
                              emailcontroller.text,
                              passwordcontroller.text,
                            )
                            .whenComplete(
                              () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => HomePage(),
                                ),
                              ),
                            ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
