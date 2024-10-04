import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_with_paystack/pay_with_paystack.dart';
import 'package:yanci/app/routes/app_pages.dart';
import 'package:yanci/app/services/storage.dart';

import '../../../components/pin_view.dart';
import '../../../constants/string_constants.dart';
import '../../../data/models/pay_model.dart';
import '../../../services/snackbar.dart';

class AddMoneyController extends GetxController {
  final RxDouble balance = 0.0.obs;

  final RxInt tabIndex = 0.obs;

  @override
  void onInit() {
    balance.value = Get.arguments ?? 0.0;
    super.onInit();
  }

  final moneyController = TextEditingController();

  void addMoney(int money) {
    balance.value += money;
    Get.back();
  }

  void addMoneyFromController(BuildContext context) {
    if (tabIndex.value == 0) {
      balance.value += int.tryParse(moneyController.text) ?? 0;
      payStack(context);
    } else {
      Get.dialog(barrierColor: Colors.white, PinView(onTap: () => Get.toNamed(Routes.ADD_CASHOUT_SUCCESSFULLY)), useSafeArea: true);
    }
  }

  payStack(BuildContext context) async {
    if (balance.value <= 100) {
      showMySnackbar(msg: StringConstants.minimumAmount, title: StringConstants.error);
      return;
    }
    final uniqueTransRef = PayWithPayStack().generateUuidV4();

    PayWithPayStack().now(
        context: context,
        secretKey: "sk_test_2ffeaee945eb5a9408a2f99ee86cb49fd62a704a",
        customerEmail: Get.find<GetStorageService>().email,
        reference: uniqueTransRef,
        callbackUrl: "https://api.investwithyanci.com/v1/users/verifyTransaction?referenceId=$uniqueTransRef&userId=${Get.find<GetStorageService>().id}",
        currency: "GHS",
        paymentChannel: ["mobile_money", "card"],
        amount: balance.value,
        transactionCompleted: () async {
          await Future.delayed(const Duration(seconds: 1));
          Get.offAllNamed(Routes.ADD_CASHOUT_SUCCESSFULLY,
              arguments: PayModel(amount: balance.value, transactionId: uniqueTransRef, payType: StringConstants.addMoney));
        },
        transactionNotCompleted: () => showMySnackbar(msg: StringConstants.transactionNotCompleted, title: StringConstants.error));
  }

  @override
  void onClose() {
    moneyController.dispose();
    super.onClose();
  }
}
