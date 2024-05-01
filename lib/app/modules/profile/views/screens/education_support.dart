import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/components/custom_chip_list.dart';
import 'package:yanci/app/components/custom_style.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/profile/controllers/profile_controller.dart';
import 'package:yanci/app/modules/profile/views/screens/blog_detail.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/gen/assets.gen.dart';

class EducationSupport extends StatelessWidget {
  const EducationSupport({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          StringConstants.educationAndSupport,
          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.kh).copyWith(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomChipList(
                labels: const [
                  StringConstants.videos,
                  StringConstants.blogs,
                ],
                selectedIndex: controller.selectedEdIndex,
              ),
              Obx(
                () => controller.selectedEdIndex.value == 0 ? _buildVideos() : _buildBlogs(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBlogs() {
    return Column(
      children: [
        TextField(
          cursorColor: Get.context!.kcPrimaryColor,
          decoration: StStyle.stInputDecoration(
            constraints: BoxConstraints(maxHeight: 40.kh, minHeight: 40.kh),
            backGroundColor: Get.context!.whiteColor,
            hint: StringConstants.searchBlogs,
            isCompactPrefix: true,
            suffixIcon: Assets.svg.search.svg(height: 20.kh),
          ),
        ),
        20.kheightBox,
        _buildBlogTile(),
        20.kheightBox,
        _buildBlogTile(),
        20.kheightBox,
        _buildBlogTile(),
        20.kheightBox,
        _buildBlogTile(),
        20.kheightBox,
        _buildBlogTile(),
        20.kheightBox,
        _buildBlogTile(),
      ],
    );
  }

  Widget _buildBlogTile() {
    return InkWell(
      onTap: () => Get.to(() => const BlogDetail()),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.kh),
            child: Assets.images.blog.image(height: 100.kh, width: 100.kw, fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.all(8.0.kh),
            child: SizedBox(
              width: 221.kw,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Understanding Gravestone Doji Pattern – How to Trade & Types",
                    style: TextStyleUtil.kText15_4(fontWeight: FontWeight.w500),
                  ),
                  10.kheightBox,
                  Text(
                    "by Trade Brains | Mar 6, 2024",
                    style: TextStyleUtil.kText14_4(color: Get.context!.greyTextColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          cursorColor: Get.context!.kcPrimaryColor,
          decoration: StStyle.stInputDecoration(
            constraints: BoxConstraints(maxHeight: 40.kh, minHeight: 40.kh),
            backGroundColor: Get.context!.whiteColor,
            hint: StringConstants.searchVideos,
            isCompactPrefix: true,
            suffixIcon: Assets.svg.search.svg(height: 20.kh),
          ),
        ),
        20.kheightBox,
        _buildVideoTile(),
        20.kheightBox,
        _buildVideoTile(),
        20.kheightBox,
        _buildVideoTile(),
        20.kheightBox,
        _buildVideoTile(),
      ],
    );
  }

  Widget _buildVideoTile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tutorial 1",
          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
        ),
        10.kheightBox,
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.kh),
            border: Border.all(width: 1, color: Get.context!.kcPrimaryColor),
          ),
          child: SizedBox(
            height: 290.kh,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(8.0.kh),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(7.kh),
                        child: Assets.images.tutorial.image(
                          height: 168.kh,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      CircleAvatar(
                        radius: 30.kh,
                        backgroundColor: const Color(0xff191919).withOpacity(0.5),
                        child: Center(
                          child: Assets.svg.play.svg(),
                        ),
                      ),
                    ],
                  ),
                  10.kheightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Lorem Ipsum",
                        style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "2 mins 30 sec",
                        style: TextStyleUtil.kText10_4(color: Get.context!.greyTextColor),
                      ),
                    ],
                  ),
                  10.kheightBox,
                  Text(
                    "Critical issue detected! Take immediate action. View emergency recommendations and ensure your safety.",
                    style: TextStyleUtil.kText14_4(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
