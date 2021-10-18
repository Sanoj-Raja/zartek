import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:zartek/app/constants/api_constants.dart';
import 'package:zartek/app/constants/app_colors.dart';
import 'package:zartek/app/constants/app_errors.dart';
import 'package:zartek/app/utils/loader.dart';
import 'base_api_helper.dart';
import 'package:get/get.dart';

class ApiHelper extends GetConnect with BaseApiHelper {
  @override
  void onInit() {
    httpClient.baseUrl = API_BASE_URL;
    httpClient.errorSafety = true;

    httpClient.addRequestModifier(
      (Request<dynamic> request) async {
        Loader().showLoadingWidget();
        RxBool isFirstTryDone = false.obs;
        RxBool isInternetAvailable = false.obs;

        while (isInternetAvailable.isFalse) {
          final connectivityResult = await (Connectivity().checkConnectivity());
          if (connectivityResult == ConnectivityResult.wifi ||
              connectivityResult == ConnectivityResult.mobile) {
            final bool isConnected =
                await InternetConnectionChecker().hasConnection;
            if (isConnected) {
              isInternetAvailable.value = true;
            } else {
              if (isFirstTryDone.isFalse)
                Get.snackbar(
                  AppErrors.noInternetError,
                  AppErrors.noInternetErrorDetails,
                );
              print('Internet is not available.');
            }
          } else {
            if (isFirstTryDone.isFalse)
              Get.snackbar(
                AppErrors.connnectionError,
                AppErrors.connnectionErrorDetails,
              );
            print('Device is not connected to wifi or mobile data.');
          }
          isFirstTryDone.value = true;
        }

        print('----Add addRequestModifier Called----');
        return request;
      },
    );

    httpClient.addResponseModifier(
      (request, response) {
        debugPrint(
          '\n╔══════════════════════════ Response ══════════════════════════\n'
          '╟ REQUEST ║ ${request.method.toUpperCase()}\n'
          '╟ url: ${request.url}\n'
          '╟ Headers: ${request.headers}\n'
          '╟ Body: ${request.bodyBytes.map((event) => event.asMap().toString())}\n'
          '╟ Status Code: ${response.statusCode}\n'
          // '╟ Data: ${response.bodyString?.toString() ?? ''}'
          '\n╚══════════════════════════ Response ══════════════════════════\n',
          wrapWidth: 1024,
        );
        // Get.back() is used for removing Loader().showLoadingWidget();
        Get.back();

        if (response.hasError) {
          Get.snackbar(
            AppErrors.errorOccurred,
            AppErrors.unknownErrorDetails,
            backgroundColor: AppColors.white,
          );
        }
      },
    );
  }

  @override
  Future<Response> getFoods() async {
    final response = await get(API_GET_FOODS);
    return response;
  }
}
