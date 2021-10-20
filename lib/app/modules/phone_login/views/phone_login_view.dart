import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek/app/constants/app_strings.dart';
import 'package:zartek/app/utils/custom_text_fields.dart';
import 'package:zartek/app/widgets/large_button.dart';
import '../controllers/phone_login_controller.dart';

class PhoneLoginView extends GetView<PhoneLoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    child: Image.asset(
                      controller.logo,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  AppStrings.welcomeContinueWithPhone,
                  style: Get.textTheme.headline1!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Form(
                  key: controller.loginFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: PhoneTextField(controller: controller.phoneController),
                ),
                SizedBox(
                  height: 20,
                ),
                LargeButton(
                  buttonText: AppStrings.sendOtp,
                  onPressed: controller.sendOtp,
                  buttonHorizontalPadding: 0,
                ),
                SizedBox(
                  height: Get.height * .1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
