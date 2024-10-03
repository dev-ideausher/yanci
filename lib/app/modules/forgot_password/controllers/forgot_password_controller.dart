import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/snackbar.dart';

class ForgotPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final TextEditingController eEmail = TextEditingController();
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> sendInstructions() async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading.value = true;
        await firebaseAuth.sendPasswordResetEmail(email: eEmail.text.trim());
        eEmail.clear();
        showMySnackbar(msg: "Instructions sent to your email", title: 'Success');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'missing-email') {
          showMySnackbar(title: "Error! ", msg: 'Invalid Email');
        } else if (e.code == 'user-not-found') {
          showMySnackbar(title: "Error! ", msg: 'Email Not registered');
        }
      }
      isLoading.value = false;
    }
  }
}
