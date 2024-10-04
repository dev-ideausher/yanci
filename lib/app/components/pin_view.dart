

import 'package:flutter/material.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:pinput/pinput.dart';

import '../utils/validation.dart';

class PinView extends StatelessWidget {
  final GestureTapCallback onTap;

  PinView({super.key, required this.onTap});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                StringConstants.setYourPin,
                style: TextStyleUtil.kText20_6(fontWeight: FontWeight.w700),
              ),
              20.kheightBox,
              Text(
                StringConstants.setYourPinText,
                textAlign: TextAlign.center,
                style: TextStyleUtil.kText14_4(),
              ),
              80.kheightBox,
              Pinput(
                obscureText: true,
                validator: (value) => !isValidPin(value, isRequired: true) ? StringConstants.invalidEmployerName : null,
                focusedPinTheme: PinTheme(
                  textStyle: TextStyleUtil.kText20_6(fontWeight: FontWeight.w700),
                  decoration: BoxDecoration(
                    color: context.kWhitelight,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: context.blackColor),
                  ),
                  width: 64.kw,
                  height: 65.kh,
                ),
                length: 4,
                defaultPinTheme: PinTheme(
                  textStyle: TextStyleUtil.kText20_6(fontWeight: FontWeight.w700),
                  decoration: BoxDecoration(color: context.kWhitelight, borderRadius: BorderRadius.circular(10)),
                  width: 64.kw,
                  height: 65.kh,
                ),
              ),
              370.kheightBox,
              CustomButton(
                title: StringConstants.continueText,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    onTap.call();
                  }
                },
                borderRadius: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
