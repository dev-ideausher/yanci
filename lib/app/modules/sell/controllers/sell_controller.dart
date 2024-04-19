import 'package:get/get.dart';
import 'package:yanci/app/data/models/stocks_model.dart';

class SellController extends GetxController {
  late StockModel stock;
  @override
  void onInit() {
    stock = Get.arguments;
    super.onInit();
  }
}
