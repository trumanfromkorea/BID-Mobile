import 'package:get/get.dart';

class AuthController extends GetxController {
  String? email;
  String? name;
  String? uid;

  setAuthInfo(String _email, String _name, String _uid) {
    print("testing");
    email = _email;
    name = _name;
    uid = _uid;
  }

  static AuthController get getter => Get.find();
}
