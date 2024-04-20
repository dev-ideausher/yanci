import 'package:get/get.dart';
import 'package:yanci/app/data/models/stocks_model.dart';

class BuyController extends GetxController {
  late StockModel stock;

  @override
  void onInit() {
    stock = Get.arguments;
    super.onInit();
  }

  RxBool isAdvanceOptionsEnabled = false.obs;
  RxInt radioValue = 0.obs;

  void changeRadioValue(int val) {
    radioValue.value = val;
  }

  void toggleAdvancedOptions() {
    isAdvanceOptionsEnabled.value = !isAdvanceOptionsEnabled.value;
  }
}
