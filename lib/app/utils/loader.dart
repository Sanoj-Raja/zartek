import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:zartek/app/constants/app_colors.dart';
import 'package:zartek/app/constants/app_errors.dart';
import 'package:zartek/app/constants/app_strings.dart';

class Loader {
  static final Loader _instance = Loader._internal();

  factory Loader() {
    return _instance;
  }

  Loader._internal();

  // Removal of this loading widget has been done at api_helper.dart.
  Future<dynamic> showLoadingWidget() => showDialog(
        barrierDismissible: false,
        context: Get.context!,
        builder: (context) => Center(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white.withOpacity(.85),
            ),
            width: 75,
            height: 75,
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
              semanticsLabel: AppStrings.loading,
              valueColor: new AlwaysStoppedAnimation<Color>(
                AppColors.lightBlue,
              ),
            ),
          ),
        ),
      );

  Widget showNoDataFound({String? message}) => Center(
        child: Text(
          message ?? AppErrors.nothingFound,
          style: Get.textTheme.headline2,
        ),
      );
}
