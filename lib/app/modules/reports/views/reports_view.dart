import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/app/utils/date_picker.dart';
import 'package:yanci/gen/assets.gen.dart';

import '../controllers/reports_controller.dart';

class ReportsView extends GetView<ReportsController> {
  const ReportsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.kWhitelight,
      appBar: AppBar(
        surfaceTintColor: context.whiteColor,
        backgroundColor: context.whiteColor,
        shadowColor: context.disabledBorderColor,
        elevation: 0,
        title: Text(
          StringConstants.reports,
          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            expandableTile(title: StringConstants.contractNote, subtitle: StringConstants.pdfOfContractNote),
            5.kheightBox,
            expandableTile(title: StringConstants.statementOfAccount, subtitle: StringConstants.pdfOfStatementOfAccount),
            5.kheightBox,
            expandableTile(title: StringConstants.profitAndLossReport, subtitle: StringConstants.pdfOfProfitAndLossReport),
            5.kheightBox,
            expandableTile(title: StringConstants.valuationReport, subtitle: StringConstants.pdfOfValuationReport),
            5.kheightBox,
            expandableTile(title: StringConstants.annualReport, subtitle: StringConstants.pdfOfAnnualReport),
          ],
        ),
      ),
    );
  }

  Widget expandableTile({required String title, required String subtitle}) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Get.context!.whiteColor),
      child: Theme(
        data: ThemeData(dividerColor: Colors.transparent),
        child: ExpansionTile(
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 20.kh,
            color: Get.context!.greyTextColor,
          ),
          title: Text(
            title,
            style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyleUtil.kText12_4(
              fontWeight: FontWeight.w500,
              color: Get.context!.greyTextColor,
            ),
          ),
          tilePadding: EdgeInsets.symmetric(horizontal: 16.kh),
          expandedAlignment: Alignment.topLeft,
          children: [
            Padding(
              padding: EdgeInsets.all(16.kw).copyWith(top: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.chooseDate,
                    style: TextStyleUtil.kText12_4(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  10.kheightBox,
                  InkWell(
                    onTap: () async {
                      controller.selectedDateTime.value = await pickDate(controller.selectedDateTime.value, "GENERATE") ?? controller.selectedDateTime.value;
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: Get.context!.disabledBorderColor),
                        borderRadius: BorderRadius.circular(6.kh),
                      ),
                      child: SizedBox(
                        height: 40.kh,
                        width: 143.kw,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.kw, vertical: 8.kh),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(
                                () => Text(
                                  formatDate(controller.selectedDateTime.value),
                                  style: TextStyleUtil.kText14_4(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Assets.svg.calendar.svg(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
