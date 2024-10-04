import 'package:get/get.dart';
import 'package:yanci/app/routes/app_pages.dart';

import '../../../data/models/pay_model.dart';
import '../../home/controllers/home_controller.dart';

class AddCashoutSuccessfullyController extends GetxController {
  final Rx<PayModel> payModel = Rx<PayModel>(PayModel());

  @override
  void onInit() {
    payModel.value = Get.arguments;
    super.onInit();
  }

  goToHome() {
    Get.find<HomeController>().index.value = 2;
    Get.offAllNamed(Routes.HOME);
  }
}
