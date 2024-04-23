import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/modules/buy/controllers/buy_controller.dart';

class AddMoneyController extends GetxController {
  final buyController = Get.find<BuyController>();

  final moneyController = TextEditingController();

  void addMoney(int money) {
    buyController.balance.value += money;
    Get.back();
  }

  void addMoneyFromController() {
    buyController.balance.value += int.parse(moneyController.text);
    Get.back();
  }

  @override
  void onClose() {
    moneyController.dispose();
    super.onClose();
  }
}
