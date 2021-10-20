import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zartek/app/constants/app_colors.dart';
import 'package:zartek/app/constants/app_errors.dart';
import 'package:zartek/app/constants/app_strings.dart';

class PhoneTextField extends StatelessWidget {
  final TextEditingController controller;

  const PhoneTextField({Key? key, required this.controller}) : super(key: key);
  final kTextFieldBorderColor = AppColors.lightBlue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      cursorColor: Colors.black,
      validator: (e) {
        if (GetUtils.isPhoneNumber(e!))
          return null;
        else
          return AppErrors.phoneNumberTextError;
      },
      style: Get.textTheme.headline2!.copyWith(
        fontSize: 18,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: kTextFieldBorderColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kTextFieldBorderColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kTextFieldBorderColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        isDense: true,
        labelText: AppStrings.phoneNumber,
        prefix: Text(AppStrings.countryCode),
        prefixStyle: Get.textTheme.headline2!.copyWith(
          fontSize: 18,
        ),
        labelStyle: Get.textTheme.headline6!.copyWith(
          color: kTextFieldBorderColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
