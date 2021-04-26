import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentHelper with ChangeNotifier {
  String hr = null;
  String min = null;
  TimeOfDay deliveryTiming = TimeOfDay.now();
  Future selectTime(BuildContext context) async {
    final selectTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (selectTime != null && selectTime != deliveryTiming) {
      deliveryTiming = selectTime;
      hr = selectTime.hour.toString();
      min = selectTime.minute.toString();
      print("=======================================" +
          selectTime.hour.toString() +
          "-----------------------------------------");
      notifyListeners();
    }
  }

  bool showCheckOutButton = false;
  bool get getShowcheckoutButton => showCheckOutButton;

  showCheckOutButtonmethod() {
    showCheckOutButton = true;
    notifyListeners();
  }

  handlePaymentSucess(
      BuildContext context, PaymentSuccessResponse paymentSuccessResponse) {
    return showResponse(context, paymentSuccessResponse.paymentId);
  }

  handlePaymentError(
      BuildContext context, PaymentFailureResponse paymentFailureResponse) {
    return showResponse(context, paymentFailureResponse.message);
  }

  handleExternalWallet(
      BuildContext context, ExternalWalletResponse ExternalWalletResponse) {
    return showResponse(context, ExternalWalletResponse.walletName);
  }

  showResponse(BuildContext context, String response) {
    return showBottomSheet(
        context: null,
        builder: (context) {
          return Container(
            height: 100,
            width: 400,
            child: Text(
              response,
              style: TextStyle(),
            ),
          );
        });
  }
}
