import 'package:del_app/Service/ManageData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calculation with ChangeNotifier {
  int cheeseValue = 0, beaconValue = 0, onionValue = 0, cartData = 0;
  String size;
  String get getsize => size;
  bool isSelected = false,
      smallTapped = false,
      mediumTapped = false,
      largeTapped = false,
      selected = false;
  int get getcheeseValue => cheeseValue;
  int get getCartData => cartData;
  int get getbeaconValue => beaconValue;
  int get getOnionValue => onionValue;
  bool get getSelected => selected;
  addCheese() {
    cheeseValue++;
    notifyListeners();
  }

  addbeacon() {
    beaconValue++;
    notifyListeners();
  }

  addonion() {
    onionValue++;
    notifyListeners();
  }

  minusCheese() {
    cheeseValue--;
    notifyListeners();
  }

  minusbeacon() {
    beaconValue--;
    notifyListeners();
  }

  minusOnion() {
    onionValue--;
    notifyListeners();
  }

  selectSmallSize() {
    smallTapped = true;
    size = "S";
    notifyListeners();
  }

  selectMediumSize() {
    mediumTapped = true;
    size = "M";
    notifyListeners();
  }

  selectLargeSize() {
    largeTapped = true;
    size = "L";
    notifyListeners();
  }

  removeAllData() {
    cheeseValue = 0;
    beaconValue = 0;
    onionValue = 0;
    mediumTapped = false;
    largeTapped = false;
    largeTapped = false;
    notifyListeners();
  }

  addToCart(BuildContext context, dynamic data) async {
    if (smallTapped != false || mediumTapped != false || largeTapped != false) {
      cartData++;
      await Provider.of<ManageData>(context, listen: false)
          .submitData(context, data);
      notifyListeners();
    } else {
      return showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: Colors.white,
              height: 50,
              child: Center(
                child: Text("Select size"),
              ),
            );
          });
    }
  }
}
