import 'package:bid_mobile/data/mainTheme.dart';
import 'package:bid_mobile/screens/Auth/SignIn.screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BID',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xff315596, themeColor),
      ),
      home: const SignInScreen(),
    );
  }
}
