import 'package:get/get.dart';
import 'package:zartek/app/constants/app_assest.dart';

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

  void signInWithGoogle() {
    print('Sign in with google tapped.');
  }
}
