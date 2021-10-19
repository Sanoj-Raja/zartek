import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'dart:async';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'app/constants/app_colors.dart';
import 'app/constants/app_errors.dart';
import 'app/constants/app_strings.dart';
import 'app/services/api_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<ApiHelper>(
    ApiHelper(),
  );
  await Firebase.initializeApp();
  await GetStorage.init();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runZonedGuarded<Future<void>>(
    () async {
      runApp(
        GetMaterialApp(
          title: AppStrings.appTitle,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          theme: ThemeData(
            primaryColor: AppColors.white,
            canvasColor: AppColors.white,
            textTheme: TextTheme(
              headline1: TextStyle(
                color: AppColors.black,
                fontSize: 24,
              ),
              headline2: TextStyle(
                color: AppColors.black,
                fontSize: 20,
              ),
              headline3: TextStyle(
                color: AppColors.grey,
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
    },
    (dynamic error, StackTrace stackTrace) {
      print('<<----------ERROR--------->> \n$error');
      print('<<----------STACK TRACE--------->> \n$stackTrace');
      Get.defaultDialog(
        title: AppErrors.errorOccurred,
        titleStyle: Get.textTheme.headline2,
        middleText: AppErrors.unknownErrorDetails,
        middleTextStyle: Get.textTheme.headline3,
        textConfirm: AppStrings.goBack.toUpperCase(),
        confirmTextColor: AppColors.white,
        radius: 5,
        buttonColor: AppColors.darkBlue,
        onConfirm: () {
          Get.back();
          // One to close the pop up screen.
          // other one for back navigation from the error page.
          Get.back();
        },
      );
    },
  );
}
