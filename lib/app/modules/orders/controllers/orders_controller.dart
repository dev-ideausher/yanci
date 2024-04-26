import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/orders/views/widgets/order_tile.dart';

class OrdersController extends GetxController {
  RxBool isAllOrdersScreen = false.obs;

  List<String> orderCategories = [
    StringConstants.all,
    StringConstants.buy,
    StringConstants.sell,
    StringConstants.stopLoss,
  ];

  RxInt selectedOrder = 0.obs;
  RxString selectedSort = StringConstants.currentlyInvested.obs;

  List<OrderTile> orders = const [
    OrderTile(
      isBuy: true,
      isStopLoss: false,
    ),
    OrderTile(
      isBuy: false,
      isStopLoss: true,
    ),
    OrderTile(
      isBuy: true,
      isStopLoss: false,
    ),
    OrderTile(
      isBuy: false,
      isStopLoss: true,
    ),
    OrderTile(
      isBuy: true,
      isStopLoss: false,
    ),
    OrderTile(
      isBuy: false,
      isStopLoss: true,
    ),
    OrderTile(
      isBuy: true,
      isStopLoss: false,
    ),
    OrderTile(
      isBuy: false,
      isStopLoss: true,
    ),
  ];

  List<OrderTile> ordersBasedOnCategory() {
    switch (selectedOrder.value) {
      case 0:
        return orders;
      case 1:
        return orders.where((element) => element.isBuy).toList();
      case 2:
        return orders.where((element) => !element.isBuy).toList();
      case 3:
        return orders.where((element) => element.isStopLoss).toList();

      default:
        return orders;
    }
  }
}
