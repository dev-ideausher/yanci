import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/data/models/stocks_model.dart';
import 'package:yanci/app/utils/date_picker.dart';

class BuyController extends GetxController {
  late StockModel stock;
  final quantityController = TextEditingController();

  @override
  void onInit() {
    stock = Get.arguments;

    super.onInit();
  }

  RxBool isAdvanceOptionsEnabled = false.obs;
  RxBool isOrderModified = false.obs;
  RxInt radioValue = 0.obs;
  RxDouble balance = 22.0.obs;
  RxInt quantity = 0.obs;
  RxDouble estimatedPrice = 0.0.obs;
  RxString selectedTimeInForce = StringConstants.dayOrder.obs;
  Rx<DateTime> goodTillDate = DateTime.now().obs;

  void changeRadioValue(int val) {
    if (val == 1) {
      selectedTimeInForce.value = StringConstants.dayOrder;
    }
    radioValue.value = val;
  }

  void addQuantity(String val) {
    if (val.isEmpty) {
      quantity.value = 0;
      estimatedPrice.value = 0.0;
      return;
    }
    quantity.value = int.parse(val);
    estimatedPrice.value = quantity.value * stock.price;
  }

  void addBalance(int val) {
    radioValue.value += val;
  }

  void toggleAdvancedOptions() {
    isAdvanceOptionsEnabled.value = !isAdvanceOptionsEnabled.value;
  }

  void selectTIF(String? val) {
    selectedTimeInForce.value = val ?? StringConstants.dayOrder;
  }

  void changeGoodTillDate() async {
    goodTillDate.value = await pickDate(goodTillDate.value) ?? DateTime.now();
  }

  @override
  void onClose() {
    quantityController.dispose();
    super.onClose();
  }
}
