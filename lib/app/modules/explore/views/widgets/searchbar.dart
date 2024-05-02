import 'package:flutter/material.dart';
import 'package:yanci/app/components/custom_style.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/gen/assets.gen.dart';

class SearchBarWithFilter extends StatelessWidget {
  const SearchBarWithFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: context.kWhitelight),
      child: SizedBox(
        width: 100.w,
        height: 70.kh,
        child: Padding(
          padding: EdgeInsets.all(16.kw),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  cursorColor: context.kcPrimaryColor,
                  style: TextStyleUtil.kText14_4(),
                  decoration: StStyle.stInputDecoration(isCompactPrefix: true, hint: StringConstants.searchForStocksETH, prefixIcon: Assets.svg.search.svg()).copyWith(contentPadding: EdgeInsets.symmetric(horizontal: 10.kw, vertical: 8.kh)),
                  textAlignVertical: TextAlignVertical.center,
                ),
              ),
              8.kwidthBox,
              DecoratedBox(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: context.kcPrimaryColor),
                child: SizedBox(
                  height: 40.kh,
                  width: 40.kh,
                  child: Center(
                    child: Assets.svg.filter.svg(height: 20.kh),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
