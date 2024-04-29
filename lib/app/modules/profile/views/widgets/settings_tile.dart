import 'package:flutter/material.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/text_style_util.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget leading;
  final VoidCallback onTap;
  const SettingsTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: leading,
          title: Text(
            title,
            style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyleUtil.kText14_4(color: context.greyTextColor),
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          onTap: () => onTap(),
        ),
        Divider(color: context.disabledBorderColor),
      ],
    );
  }
}
