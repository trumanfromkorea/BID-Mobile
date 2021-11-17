import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String bidPrice = '39,000';
  String buyPrice = '50,000';

  void getData() async {
    String url = 'http://127.0.0.1:8000/api/product/';
    var response = await http.get(Uri.parse(url));

    print(jsonDecode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: const Color.fromRGBO(0, 0, 0, 0),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            Image.asset('lib/assets/images/emptyImage.png'),
            Text("상품명"),
            Text("카테고리"),
            Text("남은 시간 02 : 08 : 24"),
            Text("상품 설명"),
            Text("처음 가격 / 입찰 횟수"),
            Text("찜한 사람")
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bookmark_add),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 130,
                  height: 50,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "입찰",
                          style: TextStyle(color: Colors.white),
                        ),
                        const VerticalDivider(
                          color: Colors.white,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              bidPrice,
                              style: TextStyle(color: Colors.white),
                            ),
                            const Text(
                              "현재 입찰가",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )
                      ]),
                  decoration: BoxDecoration(
                    color: Color(0xff0064FF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: getData,
                child: Container(
                  width: 130,
                  height: 50,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "구매",
                          style: TextStyle(color: Colors.white),
                        ),
                        const VerticalDivider(
                          color: Colors.white,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              buyPrice,
                              style: TextStyle(color: Colors.white),
                            ),
                            const Text(
                              "즉시 구매가",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )
                      ]),
                  decoration: BoxDecoration(
                    color: Color(0xffb90000),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
