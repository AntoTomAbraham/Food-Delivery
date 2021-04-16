import 'package:del_app/Service/ManageData.dart';
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
                  onTap: () {},
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
                                  fit: BoxFit.fill,
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
                                      EvaIcons.shoppingBagOutline,
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
}
