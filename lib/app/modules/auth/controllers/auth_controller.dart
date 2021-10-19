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
    Authentication.signInWithGoogle().then(
      (user) {
        if (user != null) {
          print('This is user_name ${user.displayName}');
          print('This is user_id ${user.uid}');
          print('This is user_phone_number ${user.phoneNumber}');
          print('This is user_photo_url ${user.photoURL}');

          Get.offAndToNamed(Routes.HOME);
        }
      },
    );
  }
}
