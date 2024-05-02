import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:yanci/app/data/models/stocks_model.dart';
import 'package:yanci/app/modules/explore/controllers/explore_controller.dart';

class StockDetailsController extends GetxController {
  late StockModel stock;
  late String title;
  late TrackballBehavior trackballBehavior;
  @override
  void onInit() {
    stock = Get.arguments[0];
    title = Get.arguments[1];

    trackballBehavior = TrackballBehavior(enable: true);
    super.onInit();
  }

  RxInt selectedIndex = 0.obs;
  RxBool isBarChartSelected = true.obs;

  void bookMarkTapped() {
    final exploreController = Get.find<ExploreController>();
    if (exploreController.watchList[exploreController.selectedWatchlist.value].contains(stock)) {
      Get.snackbar("Already Bookmarked", "This stock is already present in ${exploreController.watchListNames[exploreController.selectedWatchlist.value]}.");
      return;
    }
    exploreController.watchList[exploreController.selectedWatchlist.value].add(stock);
    Get.snackbar("Success", "This stock has been added in ${exploreController.watchListNames[exploreController.selectedWatchlist.value]}.");
  }
}
