import 'package:get/get.dart';
import 'package:zartek/app/routes/app_pages.dart';

class HomeController extends GetxController {
  RxInt itemInCart = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void goToCart() {
    Get.toNamed(Routes.CHECKOUT);
  }
}
