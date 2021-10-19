import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek/app/constants/app_colors.dart';

class LargeButton extends StatelessWidget {
  final String buttonText;
  final onPressed;
  final Color? buttonColor;
  final double? buttonHorizontalPadding;
  final String? buttonLeftImage;
  final double height;
  final bool isUpperCaseButtonText;
  final double fontSize;

  const LargeButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor,
    this.height = 55,
    this.fontSize = 17,
    this.buttonHorizontalPadding,
    this.buttonLeftImage,
    this.isUpperCaseButtonText = true,
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
          child: buttonLeftImage == null
              ? Center(
                  child: Text(
                    isUpperCaseButtonText
                        ? buttonText.toUpperCase()
                        : buttonText,
                    style: Get.textTheme.headline2!.copyWith(
                      color: AppColors.white,
                      fontSize: fontSize,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        height: height * .5,
                        width: height * .5,
                        child: Image.asset(
                          buttonLeftImage!,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            isUpperCaseButtonText
                                ? buttonText.toUpperCase()
                                : buttonText,
                            style: Get.textTheme.headline2!.copyWith(
                              color: AppColors.white,
                              fontSize: fontSize,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: height * .5,
                        width: height * .5,
                      ),
                    ],
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
