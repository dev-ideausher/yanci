import 'package:flutter/material.dart';
import 'package:yanci/app/components/custom_style.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/profile/views/widgets/faq_tile.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/gen/assets.gen.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.kh),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                cursorColor: context.kcPrimaryColor,
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
              const FaqTile(
                title: "How does YANCI work?",
                child: "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years.",
              ),
              Divider(color: context.disabledBorderColor),
              const FaqTile(
                title: "How does YANCI work?",
                child: "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years.",
              ),
              Divider(color: context.disabledBorderColor),
              const FaqTile(
                title: "How does YANCI work?",
                child: "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years.",
              ),
              Divider(color: context.disabledBorderColor),
              const FaqTile(
                title: "How does YANCI work?",
                child: "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years.",
              ),
              Divider(color: context.disabledBorderColor),
            ],
          ),
        ),
      ),
    );
  }
}
