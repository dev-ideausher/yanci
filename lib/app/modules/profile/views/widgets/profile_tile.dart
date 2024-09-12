import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/gen/assets.gen.dart';

import '../../../../services/storage.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 37.kh,
          backgroundImage:
              Get.find<GetStorageService>().profilePic.isEmpty ? Assets.images.profile.provider() : NetworkImage(Get.find<GetStorageService>().profilePic),
        ),
        15.kwidthBox,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             "${Get.find<GetStorageService>().firstName} ${Get.find<GetStorageService>().lastName}",
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
    );
  }
}
