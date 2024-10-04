import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/components/common_image_view.dart';
import 'package:yanci/app/data/models/stocks_model.dart';
import 'package:yanci/app/routes/app_pages.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/dialog_helper.dart';
import 'package:yanci/app/services/dio/api_service.dart';
import 'package:yanci/app/services/storage.dart';
import 'package:yanci/generated/assets.dart';

import '../../../constants/string_constants.dart';
import '../../../data/models/user_info_model.dart';
import '../../../services/dio/exceptions.dart';
import '../../../services/text_style_util.dart';

class ExploreController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final watchListNameController = TextEditingController();
  final stockNameController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Future<void> onInit() async {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
    await getUserInfo();
    await getHomepage();
  }

  Future<void> getUserInfo() async {
    try {
      final response = await APIManager.user();
      final UserInfoModel userInfoModel = UserInfoModel.fromJson(response.data);
      if (userInfoModel.data?.user?.status == "pending") {
        showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return PopScope(
              onPopInvokedWithResult: (bool didPop, Object? result) async {},
              child: AlertDialog(
                backgroundColor: Colors.white,
                title: Column(
                  children: [
                    CommonImageView(imagePath: Assets.imagesSuccessful),
                    Text(
                      StringConstants.kycPending,
                      textAlign: TextAlign.center,
                      style: TextStyleUtil.kText20_6(
                        fontWeight: FontWeight.w700,
                        color: Get.context!.kcPrimaryColor,
                      ),
                    ),
                  ],
                ),
                content: Text(
                  StringConstants.kycMessage,
                  textAlign: TextAlign.center,
                  style: TextStyleUtil.kText16_5(
                    fontWeight: FontWeight.w400,
                    color: Get.context!.blackColor,
                  ),
                ),
              ),
            );
          },
        );
        // Get.defaultDialog(barrierDismissible: false, content: Text(StringConstants.accountValidationPending), title: StringConstants.accountValidation);
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      if (errorMessage == "User is blocked") {
        showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return PopScope(
              onPopInvokedWithResult: (bool didPop, Object? result) async {},
              child: AlertDialog(
                title: Text(errorMessage),
                content: Text(StringConstants.userIsBlockedPleaseContactAdmin),
              ),
            );
          },
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  RxInt selectedWatchlist = 0.obs;
  RxList<RxList> watchList = [[].obs].obs;

  RxList<String> watchListNames = <String>["Watchlist 1"].obs;

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

  getHomepage() async {
    try {
      final response = await APIManager.homepage();
      if ((response.data['status'] ?? false) == false) {
        if (response.data['outdatedDocument'] == "privacy_policy") {
          Get.offAllNamed(Routes.PRIVACY_POLICY, arguments: response.data['latestVersion']);
        } else {
          Get.offAllNamed(Routes.TERMS, arguments: response.data['latestVersion']);
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
