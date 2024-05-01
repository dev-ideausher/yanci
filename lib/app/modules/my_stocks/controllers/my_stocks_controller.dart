import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:yanci/app/constants/string_constants.dart';

class MyStocksController extends GetxController {
  late TrackballBehavior trackballBehavior;
  @override
  void onInit() {
    trackballBehavior = TrackballBehavior(enable: true);
    super.onInit();
  }

  RxInt selectedIndex = 0.obs;
  RxDouble balance = 22.0.obs;
  RxBool isBarChartSelected = true.obs;
  RxString selectedSort = StringConstants.currentlyInvested.obs;
}
