import 'package:get/get.dart';
import 'package:zartek/app/constants/app_assest.dart';
import 'package:zartek/app/routes/app_pages.dart';
import 'package:zartek/app/utils/authentication.dart';

class AuthController extends GetxController {
  final String logo = AppImages.logo;

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

  void googleSignIn() {
    GoolgleAuthentication.signInWithGoogle();
  }

  void goToPhoneSignIn() {
    Get.toNamed(Routes.PHONE_LOGIN);
  }
}
