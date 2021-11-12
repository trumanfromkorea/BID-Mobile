// ignore_for_file: avoid_print

import 'package:bid_mobile/data/mainTheme.dart';
import 'package:bid_mobile/screens/Auth/SignIn.screen.dart';
import 'package:bid_mobile/screens/Auth/SignUp.screen.dart';
import 'package:bid_mobile/screens/Home/Home.screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;
  bool _error = false;

  var currentUser;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      authStateListener();
      setState(() {
        currentUser = FirebaseAuth.instance.currentUser;
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  void authStateListener() {
    FirebaseAuth.instance.authStateChanges().listen((firebaseUser) {
      setState(() {
        currentUser = firebaseUser;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    initializeFlutterFire();
  }

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) {
      return MaterialApp(
          theme: ThemeData(
            primarySwatch: MaterialColor(0xff315596, themeColor),
          ),
          debugShowCheckedModeBanner: false,
          color: Colors.blue,
          home: const SignInScreen());
    } else {
      return MaterialApp(
          theme: ThemeData(
            primarySwatch: MaterialColor(0xff315596, themeColor),
          ),
          debugShowCheckedModeBanner: false,
          color: Colors.blue,
          home: const HomeScreen());
    }
  }
}


// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
  
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'BID',
//       theme: ThemeData(
//         primarySwatch: MaterialColor(0xff315596, themeColor),
//       ),
//       home: const SignInScreen(),
//     );
//   }
// }
