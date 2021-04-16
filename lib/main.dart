import 'package:del_app/Helpers/Headers.dart';
import 'package:del_app/Helpers/MiddleData.dart';
import 'package:del_app/Service/ManageData.dart';
import 'package:del_app/Views/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
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
        ChangeNotifierProvider.value(value: Headers()),
        ChangeNotifierProvider.value(value: MiddleHelper()),
        ChangeNotifierProvider.value(value: ManageData()),
      ],
      child: MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
