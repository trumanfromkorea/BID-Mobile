import 'package:bid_mobile/data/mainTheme.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String dropdownValue = 'gmail.com';
  static const emailList = <String>[
    'gmail.com',
    'naver.com',
    'apple.com',
    'nate.com',
    'hanmail.net'
  ];

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('회원가입', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
          shadowColor: const Color.fromRGBO(0, 0, 0, 0),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "이름",
                  style: TextStyle(
                    fontSize: 14,
                    color: MaterialColor(0xff315596, themeColor),
                  ),
                ),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "회원님의 이름을 입력해주세요",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "이메일 (아이디)",
                  style: TextStyle(
                    fontSize: 14,
                    color: MaterialColor(0xff315596, themeColor),
                  ),
                ),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "로그인 시 사용할 이메일을 입력해주세요",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "비밀번호",
                  style: TextStyle(
                    fontSize: 14,
                    color: MaterialColor(0xff315596, themeColor),
                  ),
                ),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "8자 이상의 숫자, 문자 조합",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "비밀번호 확인",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "거주지 주소",
                  style: TextStyle(
                    fontSize: 14,
                    color: MaterialColor(0xff315596, themeColor),
                  ),
                ),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "시/군/구 도로명 및 번지수",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "상세주소",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Spacer(),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("다음",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      )),
                ),
              ),
              const SafeArea(child: SizedBox()),
            ],
          ),
        ));
  }
}
