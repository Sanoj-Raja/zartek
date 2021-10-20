import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek/app/constants/app_assest.dart';
import 'package:zartek/app/routes/app_pages.dart';

class PhoneLoginController extends GetxController {
  final logo = AppImages.logo;
  final TextEditingController phoneController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void sendOtp() {
    if (loginFormKey.currentState!.validate()) {
      Get.toNamed(
        Routes.OTP,
        arguments: {'phoneNumber': phoneController.text},
      );
    }
  }
}
