import 'package:bid_mobile/screens/Feed/Details.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  onPressDetails() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const DetailsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SafeArea(child: SizedBox()),
          CupertinoButton(child: const Text("상세 정보"), onPressed: onPressDetails),
        ],
      ),
    );
  }
}
