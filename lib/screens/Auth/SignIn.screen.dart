import 'package:bid_mobile/data/mainTheme.dart';
import 'package:bid_mobile/screens/Auth/SignUp.screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로그인', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: const Color.fromRGBO(0, 0, 0, 0),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            const Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "이메일",
                style: TextStyle(
                  fontSize: 14,
                  color: MaterialColor(0xff315596, themeColor),
                ),
              ),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "가입한 이메일을 입력해주세요",
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
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: "비밀번호를 입력해주세요",
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text("비밀번호 찾기"),
              ),
            ),
            const Spacer(),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()));
                },
                child: const Text("이메일로 회원가입하기")),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("로그인",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "카카오톡으로 로그인",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.yellow),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Google 아이디로 로그인",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, shadowColor: Colors.black),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Apple 아이디로 로그인",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.black),
              ),
            ),
            const SafeArea(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
