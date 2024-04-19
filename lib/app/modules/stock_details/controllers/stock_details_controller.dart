import 'package:get/get.dart';
import 'package:yanci/app/data/models/stocks_model.dart';

class StockDetailsController extends GetxController {
  late StockModel stock;
  @override
  void onInit() {
    stock = Get.arguments;
    super.onInit();
  }
}
