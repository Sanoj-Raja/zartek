import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek/app/constants/app_assest.dart';

class PhoneLoginController extends GetxController {
  final logo = AppImages.logo;
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey loginFormKey = GlobalKey<FormState>();

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

  void sendOtp() {}
}
