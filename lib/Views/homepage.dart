import 'package:del_app/Helpers/Headers.dart';
import 'package:del_app/Helpers/middleData.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Headers().appBar(context),
              SizedBox(height: 10),
              Headers().headerText(),
              SizedBox(height: 10),
              Headers().headerMenu(context),
              SizedBox(height: 20),
              MiddleHelper().textFav(),
              MiddleHelper().dataFav(context, 'Favourite'),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
