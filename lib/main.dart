// ignore_for_file: avoid_print

import 'package:bid_mobile/data/mainTheme.dart';
import 'package:bid_mobile/models/auth/auth.controller.dart';
import 'package:bid_mobile/screens/Auth/SignIn.screen.dart';
import 'package:bid_mobile/screens/Main.screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var currentUser = FirebaseAuth.instance.currentUser;

  void initializeFlutterFire() async {
    try {
      authStateListener();
      setState(() {
        currentUser = FirebaseAuth.instance.currentUser;
      });
    } catch (e) {
      print(e);
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
    Get.put(AuthController());

    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'NanumSquare',
        primarySwatch: MaterialColor(0xff315596, themeColor),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Color(0x00000000),
        ),
      ),
      debugShowCheckedModeBanner: false,
      color: Colors.blue,
      home: currentUser == null ? const SignInScreen() : const MainScreen(),
    );
  }
}
