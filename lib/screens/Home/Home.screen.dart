import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      children: [
        const SafeArea(child: SizedBox()),
        Text("Home Screen"),
      ],
    ));
  }
}
