import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek/app/constants/app_assest.dart';
import 'package:zartek/app/utils/authentication.dart';

class OtpController extends GetxController {
  final phone = Get.arguments['phoneNumber'];
  final verificationId = Get.arguments['verificationId'];
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
    if (formKey.currentState!.validate()) {
      PhoneAuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpTextController.text,
      );
      Authentication.loginWithCredential(authCredential);
    }
  }
}
