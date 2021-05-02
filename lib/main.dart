import 'package:del_app/Helpers/Footer.dart';
import 'package:del_app/Helpers/Headers.dart';
import 'package:del_app/Helpers/MiddleData.dart';
import 'package:del_app/Providers/Calculation.dart';
import 'package:del_app/Providers/Payment.dart';
import 'package:del_app/Providers/google_sign_in.dart';
import 'package:del_app/Providers/uidClass.dart';
import 'package:del_app/Service/ManageData.dart';
import 'package:del_app/Views/Admin/Services/AdminDetailsHelper.dart';
import 'package:del_app/Views/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:del_app/Providers/Authentication.dart';
import 'package:del_app/Providers/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AdminDetailsHelper()),
        ChangeNotifierProvider.value(value: PaymentHelper()),
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProvider.value(value: Calculation()),
        ChangeNotifierProvider.value(value: Authentication()),
        ChangeNotifierProvider.value(value: Headers()),
        ChangeNotifierProvider.value(value: MiddleHelper()),
        ChangeNotifierProvider.value(value: ManageData()),
        ChangeNotifierProvider.value(value: Footer()),
      ],
      child: MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
