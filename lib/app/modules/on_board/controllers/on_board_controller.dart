import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardController extends GetxController {
  PageController pageController = PageController();

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
}
