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
  String bidPrice = '560,000';
  String buyPrice = '600,000';

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
        title: const Text(
          "상품 정보",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('lib/assets/images/emptyImage.png'),
            const Divider(
              height: 40,
            ),
            RichText(
              text: const TextSpan(
                style: TextStyle(fontFamily: 'NanumSquare'),
                children: [
                  TextSpan(
                    text: "아이패드 프로 4세대 11인치 ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "전자 제품",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            RichText(
              text: const TextSpan(
                style: TextStyle(fontFamily: 'NanumSquare', height: 1.5),
                children: [
                  TextSpan(
                    text: "남은 시간 ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "02시간 08분 12초",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff315596),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 10),
              child: const Text(
                "상품 설명",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: const Text(
                "2021년 4월 제조 상품이고 사용할 일이 그렇게 많지 않아서 팔아요~ 상태 엄청 좋고 기스나 찍힘 하나도 없습니다! 용량은 128기가고 wifi 제품이에요",
                style: TextStyle(height: 1.5),
              ),
            ),
            const Divider(
              height: 40,
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.29,
                  child: Column(
                    children: const [
                      Text("시작 가격"),
                      Text(
                        "450,000원",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff315596),
                            height: 1.5),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.29,
                  child: Column(
                    children: const [
                      Text("입찰 수"),
                      Text(
                        "23회",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff315596),
                            height: 1.5),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.29,
                  child: Column(
                    children: const [
                      Text("찜한 사람"),
                      Text(
                        "11명",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff315596),
                            height: 1.5),
                      ),
                    ],
                  ),
                ),
              ],
            )
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
