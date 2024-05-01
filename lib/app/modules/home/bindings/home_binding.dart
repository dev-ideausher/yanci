import 'package:get/get.dart';
import 'package:yanci/app/modules/explore/controllers/explore_controller.dart';
import 'package:yanci/app/modules/my_stocks/controllers/my_stocks_controller.dart';
import 'package:yanci/app/modules/news/controllers/news_controller.dart';
import 'package:yanci/app/modules/orders/controllers/orders_controller.dart';
import 'package:yanci/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(),
      permanent: true,
    );
    Get.put<ExploreController>(
      ExploreController(),
      permanent: true,
    );
    Get.put<MyStocksController>(
      MyStocksController(),
      permanent: true,
    );
    Get.put<NewsController>(
      NewsController(),
      permanent: true,
    );
    Get.put<OrdersController>(
      OrdersController(),
      permanent: true,
    );
    Get.put<ProfileController>(
      ProfileController(),
      permanent: true,
    );
  }
}
