import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek/app/constants/app_assest.dart';

class OtpController extends GetxController {
  final phone = Get.arguments['phoneNumber'];
  final formKey = GlobalKey<FormState>();
  final logo = AppImages.logo;
  final otpTextController = TextEditingController();

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

  void verifyOtp() {
    print('Verify clicked.');
  }
}
