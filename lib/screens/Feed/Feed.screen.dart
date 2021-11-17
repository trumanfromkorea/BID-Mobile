import 'package:bid_mobile/screens/Feed/Details.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List? feedList;

  onPressDetails() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const DetailsScreen()));
  }

  void initFeedList() async {
    String url = 'http://127.0.0.1:8000/api/product/';
    var response = await http.get(Uri.parse(url));

    setState(() {
      feedList = jsonDecode(response.body);
    });
    // print(jsonDecode(response.body));
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (feedList != null) {
      return Scaffold(
        body: Column(
          children: [
            const SafeArea(child: SizedBox()),
            CupertinoButton(
                child: const Text("상세 정보"), onPressed: onPressDetails),
            Expanded(
              child: ListView.builder(
                itemCount: feedList?.length,
                itemBuilder: (context, int index) {
                  return Container(
                    child: Column(
                      children: [
                        Text(feedList?[index]['name']),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
