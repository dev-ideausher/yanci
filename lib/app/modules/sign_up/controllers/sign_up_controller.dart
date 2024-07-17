import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/routes/app_pages.dart';
import 'package:yanci/app/services/auth.dart';
import 'package:yanci/app/services/dialog_helper.dart';

class SignUpController extends GetxController {
  var isPassVisible = false.obs;
  var isConfPassVisible = false.obs;

  final formkey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var auth = Auth();
  RxBool isLoding = false.obs;
  late Timer timer;
  final isEmailVerified = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    timer = Timer.periodic(Duration(seconds: 3), (_) async {
      try {
        return await checkEmailVerified();
      } catch (e) {
        debugPrint(e.toString());
      }
    });
  }

  String? passwordValidater(String value) {
    if (value.isEmpty) {
      return "Password required";
    } else if (passwordController.text != confirmPasswordController.text) {
      return "Passwords do not match";
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
      auth.createEmailPass(email: emailController.text, pass: passwordController.text);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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

  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    User? user = FirebaseAuth.instance.currentUser;
    isEmailVerified.value = user!.emailVerified;
    if (isEmailVerified.value) {
      timer.cancel();

      auth.handleGetContact();
    }
  }
}
