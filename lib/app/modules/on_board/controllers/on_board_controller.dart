import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/services/auth.dart';

class OnBoardController extends GetxController {
  PageController pageController = PageController();
  Auth auth = Auth();

  RxInt pageCount = 0.obs;

  onDotClicked(int index) {
    pageCount.value = index;
    pageController.jumpToPage(pageCount.value);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  googleLogin() {
    auth.google();
  }

  appleLogin() {
    auth.apple();
  }

  yahooLogin() {}
}
