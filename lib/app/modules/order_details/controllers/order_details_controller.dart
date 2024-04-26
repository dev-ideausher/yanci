import 'package:get/get.dart';
import 'package:yanci/app/data/models/stocks_model.dart';

class OrderDetailsController extends GetxController {
  late StockModel stock;
  late RxBool isOrderModified;
  late RxString selectedTimeInForce;
  late RxDouble estimatedPrice;
  late RxInt quantity;
  late RxInt radioValue;
  @override
  void onInit() {
    stock = Get.arguments[0];
    isOrderModified = Get.arguments[1];
    selectedTimeInForce = Get.arguments[2];
    radioValue = Get.arguments[3];
    quantity = Get.arguments[4];
    estimatedPrice = Get.arguments[5];
    super.onInit();
  }
}
