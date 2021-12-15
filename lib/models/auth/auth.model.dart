// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> signInWithEmail(String email, String password) async {
  FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
    print("이메일 로그인 성공");
  }).catchError((error) {
    print("이메일 로그인 에러 : $error");
  });
}

Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn().catchError((error) {
    print("구글 로그인 에러 : $error");
  });
  final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

  final OAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  return await FirebaseAuth.instance.signInWithCredential(credential);
}
