import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:yanci/app/data/models/stocks_model.dart';

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
}
