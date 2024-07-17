import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/routes/app_pages.dart';

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
  void checkLogin() {
    if (!formkey.currentState!.validate()) {
      return;
    } else {
      Auth().loginEmailPass(email: emailController.text, pass: passwordController.text);
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
