import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/profile/views/screens/bank_details.dart';
import 'package:yanci/app/modules/profile/views/screens/contact_us.dart';
import 'package:yanci/app/modules/profile/views/screens/edit_profile.dart';
import 'package:yanci/app/modules/profile/views/screens/education_support.dart';
import 'package:yanci/app/modules/profile/views/screens/faq_screen.dart';
import 'package:yanci/app/modules/profile/views/screens/notifications_settings.dart';
import 'package:yanci/app/modules/profile/views/screens/privacy_policy.dart';
import 'package:yanci/app/modules/profile/views/screens/reset_password.dart';
import 'package:yanci/app/modules/profile/views/screens/terms_of_use.dart';
import 'package:yanci/app/modules/profile/views/widgets/profile_tile.dart';
import 'package:yanci/app/modules/profile/views/widgets/settings_tile.dart';
import 'package:yanci/app/routes/app_pages.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/gen/assets.gen.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    controller;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            40.kheightBox,

            // Profile section
            InkWell(
              onTap: () => Get.to(() => const EditProfile()),
              child: Padding(
                padding: EdgeInsets.all(20.kh),
                child: const ProfileTile(),
              ),
            ),

            // profile settings
            Padding(
              padding: EdgeInsets.all(20.kh).copyWith(bottom: 0),
              child: Text(
                StringConstants.profile.toUpperCase(),
                style: TextStyleUtil.kText14_4(color: context.greyTextColor),
              ),
            ),
            SettingsTile(
              title: StringConstants.bankDetails,
              subtitle: StringConstants.bankAndAutoPay,
              leading: Assets.svg.dollar.svg(),
              onTap: () => Get.to(() => const BankDetails()),
            ),
            SettingsTile(
              title: StringConstants.allOrders,
              subtitle: StringConstants.trackOrdersOrdersDetails,
              leading: Assets.svg.allOrder.svg(),
              onTap: () => controller.onAllOrdersTapped(),
            ),

            // settings
            Padding(
              padding: EdgeInsets.all(20.kh).copyWith(bottom: 0),
              child: Text(
                StringConstants.settings.toUpperCase(),
                style: TextStyleUtil.kText14_4(color: context.greyTextColor),
              ),
            ),
            SettingsTile(
              title: StringConstants.notifications,
              subtitle: StringConstants.generalAlert,
              leading: Assets.svg.settingsNotification.svg(),
              onTap: () => Get.to(() => const NotificationsSettings()),
            ),
            SettingsTile(
              title: StringConstants.resetPassword,
              subtitle: StringConstants.createNewPassword,
              leading: Assets.svg.lock.svg(),
              onTap: () => Get.to(() => const ResetPassword()),
            ),

            // help and support
            Padding(
              padding: EdgeInsets.all(20.kh).copyWith(bottom: 0),
              child: Text(
                StringConstants.help.toUpperCase(),
                style: TextStyleUtil.kText14_4(color: context.greyTextColor),
              ),
            ),
            SettingsTile(
              title: StringConstants.reports,
              subtitle: StringConstants.reportsAndAnalysis,
              leading: Assets.svg.reports.svg(),
              onTap: () => Get.toNamed(Routes.REPORTS),
            ),
            SettingsTile(
              title: StringConstants.educationAndSupport,
              subtitle: StringConstants.videosAndBlogs,
              leading: Assets.svg.education.svg(),
              onTap: () => Get.to(() => const EducationSupport()),
            ),
            SettingsTile(
              title: StringConstants.faqs,
              subtitle: StringConstants.frequentlyAskedQuestions,
              leading: Assets.svg.faq.svg(),
              onTap: () => Get.to(() => const FaqScreen()),
            ),
            SettingsTile(
              title: StringConstants.contatcUs,
              subtitle: StringConstants.questionsOrFeedback,
              leading: Assets.svg.contact.svg(),
              onTap: () => Get.to(() => const ContactUs()),
            ),
            SettingsTile(
              title: StringConstants.termsOfUse,
              subtitle: StringConstants.termsOfUse,
              leading: Assets.svg.termsAndConditions.svg(),
              onTap: () => Get.to(() => const TermsOfUse()),
            ),
            SettingsTile(
              title: StringConstants.privacyPolicy,
              subtitle: StringConstants.privacyPolicy,
              leading: Assets.svg.termsAndConditions.svg(),
              onTap: () => Get.to(() => const PrivacyPolicy()),
            ),
          ],
        ),
      ),
    );
  }
}
