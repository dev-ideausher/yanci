import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/auth.dart';

class LoginController extends GetxController {
  var isPassVisible = false.obs;
  var password = ''.obs;

  final formkey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  RxBool isLoding = false.obs;


  var auth=Auth();

  String? passwordValidater(String value) {
    if (value.isEmpty) {
      return "Password required";
    } else if (value.length < 6) {
      return "Character must me 6 or more";
    }
    return null;
  }

  // Login functions
  Future<void> checkLogin() async {
    if (!formkey.currentState!.validate()) {
      return;
    } else {
      isLoding.value = true;
     await Auth().loginEmailPass(email: emailController.text, pass: passwordController.text);
      isLoding.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
  googleLogin() {
    auth.google();
  }

  appleLogin() {
    auth.apple();
  }

  yahooLogin() {
    auth.signInWithYahoo();
  }
}
