import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  void onPressLogout() {
    FirebaseAuth.instance.signOut();
  }

  TextStyle keyText = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
    color: Colors.black54,
  );

  TextStyle valueText = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: Color(0xff315596),
    height: 1.5,
  );

  TextStyle buttonText = const TextStyle(
    fontSize: 17,
    color: Colors.black87,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: const Color.fromRGBO(0, 0, 0, 0),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "회원 정보",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  margin: const EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "장재훈",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Text(
                      "jangjh971008@naver.com",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black12,
                            width: 2,
                          ),
                        ),
                        child: const Text(
                          "내 정보 보기",
                          style: TextStyle(
                            color: Color(0xff777777),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Colors.black38,
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: const Text(
                "구매 내역",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  color: Color(0xffeeeeee),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.29,
                    child: Column(
                      children: [
                        Text("입찰", style: keyText),
                        Text(
                          "16회",
                          style: valueText,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.29,
                    child: Column(
                      children: [
                        Text("낙찰", style: keyText),
                        Text(
                          "2회",
                          style: valueText,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.29,
                    child: Column(
                      children: [
                        Text("즉시 구매", style: keyText),
                        Text(
                          "2회",
                          style: valueText,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 10),
              child: const Text(
                "판매 내역",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Color(0xffeeeeee),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.29,
                    child: Column(
                      children: [
                        Text(
                          "게시",
                          style: keyText,
                        ),
                        Text(
                          "10회",
                          style: valueText,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.29,
                    child: Column(
                      children: [
                        Text(
                          "낙찰",
                          style: keyText,
                        ),
                        Text(
                          "7회",
                          style: valueText,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.29,
                    child: Column(
                      children: [
                        Text(
                          "즉시 판매",
                          style: keyText,
                        ),
                        Text(
                          "3회",
                          style: valueText,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.black38,
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Text(
                    "공지사항 & FAQ",
                    style: buttonText,
                  ),
                  const Spacer(),
                  const Icon(Icons.chevron_right),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Text(
                    "환경 설정",
                    style: buttonText,
                  ),
                  const Spacer(),
                  const Icon(Icons.chevron_right),
                ],
              ),
            ),
            GestureDetector(
              onTap: onPressLogout,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Text(
                      "로그아웃",
                      style: buttonText,
                    ),
                    const Spacer(),
                    const Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
