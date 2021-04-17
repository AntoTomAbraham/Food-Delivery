import 'package:del_app/Service/ManageData.dart';
import 'package:del_app/Views/DetailScreen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MiddleHelper extends ChangeNotifier {
  Widget textFav() {
    return RichText(
        text: TextSpan(
      text: "Favourite ",
      style: TextStyle(
        shadows: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 1,
          )
        ],
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontSize: 46.0,
      ),
      children: <TextSpan>[
        TextSpan(
          text: 'dishes',
          style: TextStyle(
            shadows: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 0,
              )
            ],
            fontSize: 29.0,
            fontWeight: FontWeight.w300,
            color: Colors.grey,
          ),
        )
      ],
    ));
  }

  Widget dataFav(BuildContext context, String collection) {
    return Container(
      height: 300.0,
      child: FutureBuilder(
        //future is the particular source from where we get the Data
        future: Provider.of<ManageData>(context, listen: false)
            .fetchData(collection),
        //Asyncsnapshot gives us the data when the future is called
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Image.network(
                "https://tse3.mm.bing.net/th?id=OIP.ixrIL01VXJFnaBin_oqH0QHaFj&pid=Api&P=0&w=229&h=173",
              ),
            );
          }
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              //itembuilder needs a build context and a index for compulsory
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => DetailScreen(
                            queryDocumentSnapshot: snapshot.data[index],
                          ),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 4.0,
                      left: 8.0,
                      bottom: 4.0,
                    ),
                    child: Container(
                      height: 300,
                      width: 200.0,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              blurRadius: 3,
                              spreadRadius: 3,
                            ),
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(40.0),
                          ),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              SizedBox(
                                height: 200.0,
                                child: Image.network(
                                  snapshot.data[index].data()['image'],
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Positioned(
                                  left: 140.0,
                                  child: IconButton(
                                    icon: Icon(
                                      EvaIcons.heart,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {},
                                  ))
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              snapshot.data[index].data()['name'],
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w200,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              snapshot.data[index].data()['category'],
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w800,
                                color: Colors.cyan,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      EvaIcons.star,
                                      color: Colors.yellow.shade700,
                                    ),
                                    Text(
                                      snapshot.data[index].data()['ratings'],
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.monetization_on,
                                      color: Colors.yellow.shade700,
                                    ),
                                    Text(
                                      snapshot.data[index]
                                          .data()['price']
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }

  Widget business(BuildContext context, String collection) {
    return Container(
        height: 400,
        child: FutureBuilder(
            //future is the particular source from where we get the Data
            future: Provider.of<ManageData>(context, listen: false)
                .fetchData(collection),
            //Asyncsnapshot gives us the data when the future is called
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Image.network(
                    "https://tse3.mm.bing.net/th?id=OIP.ixrIL01VXJFnaBin_oqH0QHaFj&pid=Api&P=0&w=229&h=173",
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade500,
                                  blurRadius: 3,
                                  spreadRadius: 3,
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(40.0),
                              ),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      snapshot.data[index].data()['name'],
                                      style: TextStyle(
                                        fontSize: 26.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                        snapshot.data[index].data()['category'],
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.cyan,
                                        )),
                                    Text(
                                      snapshot.data[index]
                                          .data()['notPrice']
                                          .toString(),
                                      style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.cyan,
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.monetization_on,
                                          size: 16.0,
                                        ),
                                        Text(
                                          snapshot.data[index]
                                              .data()['price']
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w200,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                height: 200.0,
                                child: Image.network(
                                  snapshot.data[index].data()['image'],
                                  fit: BoxFit.contain,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            }));
  }

  Widget textbuss() {
    return RichText(
        text: TextSpan(
      text: "Business ",
      style: TextStyle(
        shadows: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 1,
          )
        ],
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontSize: 46.0,
      ),
      children: <TextSpan>[
        TextSpan(
          text: 'lunch',
          style: TextStyle(
            shadows: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 0,
              )
            ],
            fontSize: 29.0,
            fontWeight: FontWeight.w300,
            color: Colors.grey,
          ),
        )
      ],
    ));
  }
}
