import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class Headers extends ChangeNotifier {
  Widget appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              icon: Icon(
                EvaIcons.menu2,
                size: 30,
              ),
              onPressed: () {}),
          Row(
            children: <Widget>[
              Icon(
                EvaIcons.mapOutline,
                color: Colors.grey.shade600,
              ),
              Text(
                "New Police Area",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          IconButton(
              icon: Icon(
                EvaIcons.searchOutline,
                color: Colors.black,
              ),
              onPressed: () {}),
        ],
      ),
    );
  }

  Widget headerText() {
    return Container(
      constraints: BoxConstraints(maxWidth: 300.0),
      child: RichText(
          text: TextSpan(
        text: "What would you like ",
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: Colors.black,
          fontSize: 29.0,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'to eat?',
            style: TextStyle(
              fontSize: 46.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          )
        ],
      )),
    );
  }

  Widget headerMenu(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.red,
                  blurRadius: 15.0,
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: Colors.grey.shade100,
            ),
            height: 40.0,
            width: 100.0,
            child: Center(
              child: Text(
                "All Food",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.blue,
                  blurRadius: 15.0,
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: Colors.grey.shade100,
            ),
            height: 40.0,
            width: 100.0,
            child: Center(
              child: Text(
                "Rice",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.green,
                  blurRadius: 15.0,
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: Colors.grey.shade100,
            ),
            height: 40.0,
            width: 100.0,
            child: Center(
              child: Text(
                "Palaharam",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
