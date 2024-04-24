import 'package:get/get.dart';
import 'package:yanci/app/modules/explore/controllers/explore_controller.dart';
import 'package:yanci/app/modules/my_stocks/controllers/my_stocks_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ExploreController>(
      () => ExploreController(),
    );
    Get.lazyPut<MyStocksController>(
      () => MyStocksController(),
    );
  }
}
