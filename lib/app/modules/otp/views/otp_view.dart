import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:zartek/app/constants/app_colors.dart';
import 'package:zartek/app/constants/app_strings.dart';
import 'package:zartek/app/widgets/large_button.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
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
                  'OTP Verification',
                  style: Get.textTheme.headline1!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'We have sent a 4 digit OTP\nto ${controller.phone}.',
                  style: Get.textTheme.headline2,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: controller.formKey,
                    child: PinCodeTextField(
                      controller: controller.otpTextController,
                      useHapticFeedback: true,
                      pastedTextStyle: TextStyle(
                        color: AppColors.lightBlue,
                      ),
                      length: 4,
                      obscureText: true,
                      obscuringCharacter: '*',
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length == 3) {
                          return 'OTP must be a 4 digit number only.';
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.underline,
                        fieldHeight: 40,
                        inactiveFillColor: Colors.transparent,
                        selectedFillColor: Colors.transparent,
                        inactiveColor: Colors.grey,
                        activeFillColor: Colors.transparent,
                        fieldWidth: 40,
                      ),
                      autoDismissKeyboard: true,
                      cursorColor: AppColors.black,
                      animationDuration: Duration(milliseconds: 300),
                      textStyle: TextStyle(
                        fontSize: 25,
                        height: 1.3,
                        color: AppColors.lightBlue,
                      ),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      keyboardType: TextInputType.number,
                      onChanged: (String value) {},
                      appContext: context,
                    ),
                  ),
                ),
                LargeButton(
                  buttonText: AppStrings.verifyOtp,
                  onPressed: controller.verifyOtp,
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
