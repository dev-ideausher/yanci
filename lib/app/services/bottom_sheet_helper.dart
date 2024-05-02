import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/components/custom_textfield.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/explore/controllers/explore_controller.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

class BottomSheetHelper {
  static void addWatchList([String? message, bool canPop = true]) {
    final exploreController = Get.find<ExploreController>();
    Get.bottomSheet(
      PopScope(
        canPop: canPop,
        onPopInvoked: (pop) => Future.value(true),
        child: SizedBox(
          height: 282.kh,
          width: double.maxFinite,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.kw).copyWith(
              top: 26.kh,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringConstants.createWatchlist,
                  style: TextStyleUtil.kText20_6(),
                ),
                20.kheightBox,
                Form(
                  key: exploreController.key,
                  child: StTextField(
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return StringConstants.enterWatchListName;
                      } else if (exploreController.watchListNames.contains(p0.trim())) {
                        return StringConstants.watchListAlreadyExists;
                      }
                      return null;
                    },
                    title: Text(
                      StringConstants.listName,
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                    ),
                    hint: StringConstants.watchlist,
                    controller: exploreController.watchListNameController,
                  ),
                ),
                20.kheightBox,
                CustomButton(
                  onTap: exploreController.addWatchList,
                  title: StringConstants.create,
                  height: 48.kh,
                  borderRadius: 50,
                ),
              ],
            ),
          ),
        ),
      ),
      barrierColor: const Color(0xff141A31).withOpacity(.4),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      backgroundColor: Colors.white,
      isScrollControlled: true,
      enableDrag: false,
    );
  }
}
