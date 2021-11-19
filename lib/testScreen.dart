// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

// Future 는 비동기 처리방식의 일종
Future<List<Photo>> fetchPhotos(http.Client client) async {
  String url = 'https://jsonplaceholder.typiCode.com/photos';
  final response = await client.get(Uri.parse(url));

  // compute 를 이용하여 백그라운드 isolate 작업이 가능하게 함 
  // 오래 걸리는 메소드를 백그라운드 isolate 에서 돌리고 결과 반환 (then 으로 반환가능)
  // isolate 간 Future 혹은 http.Response 등 복잡한 객체를 주고받으면 에러가 생길수도 있음
  // 파라미터는 (메소드, 메소드에 필요한 인자)
  // 이때 메소드는 클래스 외부 최상위에 구현되어있어야 함
  return compute(parsePhotos, response.body);
}

// Future 에서 받아온 응답결과를 Photo 리스트로 반환
// compute 안으로 들어오는 메소드
List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Future 공부"),
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("error : ${snapshot.error}");
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return PhotosList(photos: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  const PhotosList({Key? key, required this.photos}) : super(key: key);

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Text(photos[index].id.toString()),
            Image.network(photos[index].thumbnailUrl),
          ],
        );
      },
    );
  }
}

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  // factory - 생성자를 통해 매번 instancing 하지 않고 재활용
  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}
