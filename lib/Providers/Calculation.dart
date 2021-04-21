import 'package:flutter/cupertino.dart';

class Calculations with ChangeNotifier {
  int cheeseValue = 0, beaconValue = 0, onionValue = 0, cartData = 0;
  String size;
  bool isSelected = false,
      smallTapped = false,
      mediumTapped = false,
      largeTapped = false,
      selected = false;
  int get getcheeseValue => cheeseValue;
  int get getCartData => cartData;
  int get getbeaconValue => beaconValue;
  int get geOnionValue => onionValue;
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

  addToCart(BuildContext context, dynamic data) {
    if (smallTapped != false || mediumTapped != false || largeTapped != false) {
      cartData++;
    }
  }
}
