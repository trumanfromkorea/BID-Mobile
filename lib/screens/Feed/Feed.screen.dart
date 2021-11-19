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
  var sampleData = [1, 2, 3, 4, 5, 6, 7];

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
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const DetailsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FEED"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: sampleData.length,
            itemBuilder: (context, int index) {
              return GestureDetector(
                onTap: onPressDetails,
                child: Container(
                    alignment: Alignment.center,
                    // margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 25),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black38,
                          width: 0.5,
                        ),
                      ),
                      // borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.width * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: const Text(
                                "아이패드 프로 4세대 11인치",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                  style: const TextStyle(
                                    fontFamily: 'NanumSquare',
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "입찰가 ",
                                      style: keyText,
                                    ),
                                    TextSpan(
                                      text: "550,000원",
                                      style: valueText,
                                    )
                                  ]),
                            ),
                            RichText(
                              text: TextSpan(
                                  style: const TextStyle(
                                    fontFamily: 'NanumSquare',
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "입찰수 ",
                                      style: keyText,
                                    ),
                                    TextSpan(
                                      text: "17회",
                                      style: valueText,
                                    )
                                  ]),
                            ),
                            RichText(
                              text: TextSpan(
                                  style: const TextStyle(
                                    fontFamily: 'NanumSquare',
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "마감일 ",
                                      style: keyText,
                                    ),
                                    TextSpan(
                                      text: "21.11.10 10:00 AM",
                                      style: valueText,
                                    )
                                  ]),
                            ),
                          ],
                        )
                      ],
                    )),
              );
            }),
      ),
      // body: Column(
      //   children: [
      //     const SafeArea(child: SizedBox()),
      //     FutureBuilder<List<Post>>(
      //       future: fetchPosts(http.Client()),
      //       builder: (context, snapshot) {
      //         if (snapshot.hasData) {
      //           return PostsList(posts: snapshot.data!);
      //         } else if (snapshot.hasError) {
      //           return const Text("Error");
      //         } else {
      //           return const CircularProgressIndicator();
      //         }
      //       },
      //     )
      //   ],
      // ),
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
