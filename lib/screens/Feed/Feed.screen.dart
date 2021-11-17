import 'package:bid_mobile/screens/Feed/Details.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Post> fetchPost() async {
  String url = 'http://127.0.0.1:8000/api/product/';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    print("api 호출 성공 : ${json.decode(response.body)}");
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('api 호출 실패');
  }
}

class Post {
  final int id;
  final String name;
  final int price;
  final String createdAt;

  Post(
      {required this.id,
      required this.name,
      required this.price,
      required this.createdAt});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      createdAt: json['created_at'],
    );
  }
}

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late Future<Post> post;

  onPressDetails() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const DetailsScreen()));
  }

  @override
  initState() {
    super.initState();
    post = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SafeArea(child: SizedBox()),
          CupertinoButton(
              child: const Text("상세 정보"), onPressed: onPressDetails),
          FutureBuilder(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.toString());
              } else {
                return Text("error : ${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          )
        ],
      ),
    );
  }
}
