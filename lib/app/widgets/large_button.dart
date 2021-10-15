import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek/app/constants/app_colors.dart';

class LargeButton extends StatelessWidget {
  final String buttonText;
  final onPressed;
  final Color? buttonColor;
  final double? buttonHorizontalPadding;
  final double height;
  final double fontSize;

  const LargeButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor,
    this.height = 55,
    this.fontSize = 17,
    this.buttonHorizontalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: buttonHorizontalPadding ?? 15.0,
      ),
      child: ElevatedButton(
        child: Container(
          height: height,
          child: Center(
            child: Text(
              buttonText.toUpperCase(),
              style: Get.textTheme.headline2!.copyWith(
                color: AppColors.white,
                fontSize: fontSize,
              ),
            ),
          ),
        ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: buttonColor ?? AppColors.darkBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }
}
