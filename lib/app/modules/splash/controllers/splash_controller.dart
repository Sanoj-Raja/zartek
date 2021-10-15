import 'package:get/get.dart';
import 'package:zartek/app/constants/app_assest.dart';
import 'package:zartek/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final logo = AppImages.logo;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 2)).then(
      (_) {
        Get.offNamed(Routes.HOME);
      },
    );
  }

  @override
  void onClose() {}
}
