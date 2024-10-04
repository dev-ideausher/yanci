import 'package:get/get.dart';

import '../controllers/add_cashout_successfully_controller.dart';

class AddCashoutSuccessfullyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCashoutSuccessfullyController>(
      () => AddCashoutSuccessfullyController(),
    );
  }
}
