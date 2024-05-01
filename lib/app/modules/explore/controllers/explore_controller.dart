import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/data/models/stocks_model.dart';
import 'package:yanci/app/services/dialog_helper.dart';
import 'package:yanci/app/services/storage.dart';

class ExploreController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final watchListNameController = TextEditingController();
  final stockNameController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  RxInt selectedWatchlist = 0.obs;
  RxList<RxList> watchList = [
    [].obs
  ].obs;

  RxList<String> watchListNames = <String>[
    "Watchlist 1"
  ].obs;

  void addWatchList() {
    if (key.currentState?.validate() ?? watchListNameController.text.trim().isEmpty) {
      watchList.add([].obs);
      watchListNames.add(watchListNameController.text.trim());
      watchListNameController.clear();
      Get.back();
    }
  }

  void removeWatchList(int index) {
    watchList.removeAt(index);
    watchListNames.removeAt(index);
    if (watchList.isEmpty) {
      watchList.add([].obs);
      watchListNames.add("Watchlist 1");
    } else {
      selectedWatchlist.value = 0;
    }
    Get.back();
  }

  void addStockInWatchList(StockModel stock, int index) {
    if (watchList[index].contains(stock)) {
      Get.snackbar("Error", "Item already in the watchlist.");
      return;
    }
    watchList[index].add(stock);
  }

  void removeStockFromWatchList(StockModel stock, int index) {
    if (watchList[index].contains(stock)) {
      watchList[index].remove(stock);
      return;
    }
    Get.snackbar("Error", "Item not in the watchlist.");
  }

  @override
  void onReady() {
    super.onReady();
    if (!GetStorageService().isFirstTime) {
      DialogHelper.showTutorial();
      GetStorageService().isFirstTime = true;
    }
  }

  @override
  void onClose() {
    tabController.dispose();
    watchListNameController.dispose();
    stockNameController.dispose();
    super.onClose();
  }
}
