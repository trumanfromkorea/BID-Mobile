import 'package:bid_mobile/screens/Feed/Details.screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<List<Post>> fetchPosts(http.Client client) async {
  String url = 'http://127.0.0.1:8000/api/product/';
  final response = await client.get(Uri.parse(url));
  print(response.body);
  return compute(parsePosts, response.body);
}

List<Post> parsePosts(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
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
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      createdAt: json['created_at'] as String,
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SafeArea(child: SizedBox()),
          CupertinoButton(
            child: const Text("상세 정보"),
            onPressed: onPressDetails,
          ),
          FutureBuilder<List<Post>>(
            future: fetchPosts(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return PostsList(posts: snapshot.data!);
              } else if (snapshot.hasError) {
                return const Text("Error");
              } else {
                return const CircularProgressIndicator();
              }
            },
          )
        ],
      ),
    );
  }
}

class PostsList extends StatelessWidget {
  const PostsList({Key? key, required this.posts}) : super(key: key);

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Text(posts[index].name),
          ],
        );
      },
    );
  }
}
