import 'package:get/get.dart';

import '../controllers/explore_controller.dart';

class ExploreBinding extends Bindings {
  @override
  void dependencies() {
    Get.find<ExploreController>();
  }
}
