// ignore_for_file: avoid_print

import 'package:bid_mobile/data/mainTheme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  TextEditingController emailController = TextEditingController();

  void onPressSend() {
    FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text)
        .then((response) => print("이메일 발송"))
        .catchError((error) => print("비밀번호 재설정 : $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('비밀번호 찾기', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: const Color.fromRGBO(0, 0, 0, 0),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "이메일",
                style: TextStyle(
                  fontSize: 16,
                  color: MaterialColor(0xff315596, themeColor),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "가입되어 있는 이메일을 입력해주세요",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "* 입력한 이메일 주소로 비밀번호 재설정 링크가 발송됩니다.\n* 인증 메일은 발송 후 24시간 내에만 유효합니다.",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black45,
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPressSend,
                child: const Text("비밀번호 재설정",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    )),
              ),
            ),
            const SafeArea(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
