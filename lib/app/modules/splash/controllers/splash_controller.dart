import 'package:get/get.dart';
import 'package:zartek/app/constants/app_assest.dart';
import 'package:zartek/app/local_storage/cart_session_manger.dart';
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
    CartSessionManager.getCart();
    Future.delayed(Duration(seconds: 2)).then(
      (_) {
        Get.offAndToNamed(Routes.HOME);
      },
    );
  }

  @override
  void onClose() {}
}
