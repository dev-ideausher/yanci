import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';

import '../../../../gen/assets.gen.dart';
import '../../../components/custom_style.dart';
import '../../../constants/string_constants.dart';
import '../../../data/models/faq_model.dart';
import '../../../services/text_style_util.dart';
import '../../profile/views/widgets/faq_tile.dart';
import '../controllers/faq_controller.dart';

class FaqView extends GetView<FaqController> {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: context.whiteColor,
        backgroundColor: context.whiteColor,
        shadowColor: context.disabledBorderColor,
        elevation: 1,
        title: Text(
          StringConstants.faqs,
          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.kh),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              cursorColor: context.kcPrimaryColor,
              onChanged:  (searchFaq) {
                controller.search(searchFaq);
              },
              decoration: StStyle.stInputDecoration(
                backGroundColor: context.whiteColor,

                hint: "Search questions",
                hintStyle: TextStyleUtil.kText14_4(color: context.kNotActive),
                prefixIcon: Assets.svg.searchNormal.svg(height: 24.kh),
                suffixIcon: Assets.svg.microphone.svg(height: 24.kh),
                isCompactPrefix: true,
              ),
            ),
            20.kheightBox,
            Text(
              StringConstants.mostVisitedFaq,
              style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w700),
            ),
            20.kheightBox,
            Expanded(
                child: Obx(
              () => controller.isLoad.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        final FaqModelData faq = controller.faqs[index];
                        return FaqTile(title: faq.question ?? "", child: faq.answer ?? "");
                      },
                      separatorBuilder: (context, index) => Divider(color: context.disabledBorderColor),
                      itemCount: controller.faqs.length),
            )),
          ],
        ),
      ),
    );
  }
}
