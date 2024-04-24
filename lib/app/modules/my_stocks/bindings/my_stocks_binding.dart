import 'package:get/get.dart';

import '../controllers/my_stocks_controller.dart';

class MyStocksBinding extends Bindings {
  @override
  void dependencies() {
    Get.find<MyStocksController>();
  }
}
