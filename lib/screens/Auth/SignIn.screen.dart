// ignore_for_file: avoid_print

import 'package:bid_mobile/data/mainTheme.dart';
import 'package:bid_mobile/models/auth/auth.model.dart';
import 'package:bid_mobile/screens/Auth/Password.screen.dart';
import 'package:bid_mobile/screens/Auth/SignUp.screen.dart';
import 'package:bid_mobile/widgets/common/Loading.widget.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool loading = false;

  setLoadingTrue() {
    setState(() {
      loading = true;
    });
  }

  setLoadingFalse() {
    setState(() {
      loading = false;
    });
  }

  void _signInWithEmail() async {
    setLoadingTrue();
    await signInWithEmail(emailController.text, passwordController.text);
    setLoadingFalse();
  }

  void _signInWithGoogle() async {
    setLoadingTrue();
    await signInWithGoogle();
    setLoadingFalse();
  }

  void onPressPasswordButton() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const PasswordScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
                    hintText: "이메일을 입력해주세요",
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
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: "비밀번호를 입력해주세요",
                  ),
                  obscureText: true,
                  obscuringCharacter: '·',
                  enableSuggestions: false,
                  autocorrect: false,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: onPressPasswordButton,
                    child: const Text("비밀번호 찾기"),
                  ),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                    },
                    child: const Text("이메일로 회원가입하기")),
                GestureDetector(
                  onTap: _signInWithEmail,
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: mainThemeColor,
                    ),
                    child: const Text("로그인",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xfffee500),
                    ),
                    child: const Text("카카오 로그인",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: _signInWithGoogle,
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black45,
                        width: 0.3,
                      ),
                      color: Colors.white,
                    ),
                    child: const Text("Google 로 로그인",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
               GestureDetector(
                  onTap: (){},
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                    child: const Text("Apple 로 로그인",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
                const SafeArea(child: SizedBox()),
              ],
            ),
          ),
        ),
        loading ? const LoadingWidget() : const SizedBox.shrink(),
      ],
    );
  }
}
