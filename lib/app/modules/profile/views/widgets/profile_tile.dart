import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/gen/assets.gen.dart';

import '../../../../services/storage.dart';
import '../../controllers/profile_controller.dart';

class ProfileTile extends GetView<ProfileController> {
  const ProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          CircleAvatar(
            radius: 37.kh,
            backgroundImage: controller.profilePic.value.isEmpty ? Assets.images.profile.provider() : NetworkImage(controller.profilePic.value),
          ),
          15.kwidthBox,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.name.value,
                style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
              ),
              Text(
                StringConstants.accountDetails,
                style: TextStyleUtil.kText14_4(color: context.greyTextColor),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_rounded,
          ),
        ],
      ),
    );
  }
}
