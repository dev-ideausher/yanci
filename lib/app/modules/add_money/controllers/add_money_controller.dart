import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMoneyController extends GetxController {
  late RxDouble balance;
  @override
  void onInit() {
    balance = Get.arguments;
    super.onInit();
  }

  final moneyController = TextEditingController();

  void addMoney(int money) {
    balance.value += money;
    Get.back();
  }

  void addMoneyFromController() {
    balance.value += int.tryParse(moneyController.text) ?? 0;
    Get.back();
  }

  @override
  void onClose() {
    moneyController.dispose();
    super.onClose();
  }
}
