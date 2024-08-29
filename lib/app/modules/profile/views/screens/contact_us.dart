import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/components/custom_dropdown.dart';
import 'package:yanci/app/components/custom_required_rich_text.dart';
import 'package:yanci/app/components/custom_style.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/profile/controllers/profile_controller.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: context.whiteColor,
        backgroundColor: context.whiteColor,
        shadowColor: context.disabledBorderColor,
        elevation: 1,
        title: Text(
          StringConstants.contatcUs,
          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.kh),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StDropDown(
                value: controller.selectedContact.value,
                title: StRichText(
                  text: StringConstants.whatDoYouWantToSubmit,
                  color: context.redColor,
                ),
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: StringConstants.query, label: StringConstants.query),
                  DropdownMenuEntry(value: StringConstants.feedback, label: StringConstants.feedback),
                ],
                onSelected: (p0) => controller.selectedContact.value = p0,
              ),
              20.kheightBox,
              Obx(
                () => controller.selectedContact.value == StringConstants.query
                    ? Column(
                        children: [
                          StDropDown(
                            value: controller.selectedTypeOfQuery.value,
                            title: StRichText(
                              text: StringConstants.typeOfQuery,
                              color: context.redColor,
                            ),
                            dropdownMenuEntries: const [
                              DropdownMenuEntry(value: StringConstants.general, label: StringConstants.general),
                              DropdownMenuEntry(value: StringConstants.transactionFailed, label: StringConstants.transactionFailed),
                              DropdownMenuEntry(value: StringConstants.moneyIssue, label: StringConstants.moneyIssue),
                              DropdownMenuEntry(value: StringConstants.refund, label: StringConstants.refund),
                              DropdownMenuEntry(value: StringConstants.cancellation, label: StringConstants.cancellation),
                            ],
                            onSelected: (p0) => controller.selectedTypeOfQuery.value = p0,
                          ),
                          20.kheightBox,
                        ],
                      )
                    : 0.kheightBox,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0.kh),
                child: Text(
                  StringConstants.addsomeDetails,
                  style: TextStyleUtil.kText14_4(),
                ),
              ),
              TextField(
                maxLines: 5,
                controller: controller.queryController,
                cursorColor: context.kcPrimaryColor,
                decoration: StStyle.stInputDecoration(
                  backGroundColor: context.whiteColor,
                  hint: "Write here",
                  hintStyle: TextStyleUtil.kText14_4(color: Get.context!.kNotActive),
                ),
              ),
              10.kheightBox,
              Text(
                controller.selectedContact.value == StringConstants.query ? StringConstants.queryDetails : StringConstants.feedbackDetails,
                style: TextStyleUtil.kText14_4(color: context.greyTextColor),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.kh),
        child: CustomButton(
          borderRadius: 50,
          title: StringConstants.submit,
          onTap: () => controller.submitQuery(),
        ),
      ),
    );
  }
}
