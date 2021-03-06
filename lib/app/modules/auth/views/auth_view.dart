import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek/app/constants/app_assest.dart';
import 'package:zartek/app/constants/app_colors.dart';
import 'package:zartek/app/constants/app_strings.dart';
import 'package:zartek/app/widgets/large_button.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  controller.logo,
                ),
              ),
              LargeButton(
                buttonText: AppStrings.signInWithGoogle,
                onPressed: 
                 controller.googleSignIn,
                isUpperCaseButtonText: false,
                buttonLeftImage: AppImages.google,
                fontSize: 20,
              ),
              SizedBox(height: 15),
              LargeButton(
                buttonText: AppStrings.signInWithPhone,
                onPressed: controller.goToPhoneSignIn,
                isUpperCaseButtonText: false,
                buttonColor: AppColors.lightBlue,
                buttonLeftImage: AppImages.phone,
                fontSize: 20,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
