import 'package:bid_mobile/data/mainTheme.dart';
import 'package:bid_mobile/screens/Feed/Details.screen.dart';
import 'package:bid_mobile/screens/Feed/Write.screen.dart';
import 'package:bid_mobile/widgets/Feed/list_candidate.widget.dart';
import 'package:bid_mobile/widgets/Feed/list_running.widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:dio/dio.dart';

Future<List<Post>> fetchPosts(http.Client client) async {
  String url = 'http://127.0.0.1:8000/api/product/';
  final response = await Dio().get(url);
  print(response);
  return compute(parsePosts, response);
}

List<Post> parsePosts(dynamic responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
}

class Post {
  final int id;
  final String name;
  final int startPrice;
  final int bidCount;
  final String expireDate;

  Post({
    required this.id,
    required this.name,
    required this.startPrice,
    required this.bidCount,
    required this.expireDate,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      name: json['name'] as String,
      startPrice: json['startPrice'] as int,
      bidCount: json['bidCount'] as int,
      expireDate: json['expireDate'] as String,
    );
  }
}

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  TextStyle keyText = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Colors.black45,
  );

  TextStyle valueText = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  onPressDetails() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailsScreen()));
  }

  List dataList = [];

  void initList() async {
    String url = 'http://127.0.0.1:8000/api/product/';
    final response = await Dio().get(url);
    // print(response.data);
    setState(() {
      dataList = response.data;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    initList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "FEED",
            style: TextStyle(color: Colors.black),
          ),
          shadowColor: const Color.fromRGBO(0, 0, 0, 0),
          backgroundColor: Colors.white,
          bottom: TabBar(
            unselectedLabelColor: const Color(0xffcdcdcd),
            labelColor: mainThemeColor,
            controller: _tabController,
            tabs: const [
              Tab(
                child: Text(
                  "진행 중",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "진행 예정",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            ListRunning(
              dataList: dataList,
            ),
            ListCandidate(
              dataList: dataList,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const WriteScreen()));
          },
          child: const Icon(Icons.add),
        ));
  }
}
