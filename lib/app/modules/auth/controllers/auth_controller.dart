import 'package:get/get.dart';
import 'package:zartek/app/constants/app_assest.dart';
import 'package:zartek/app/local_storage/sessions.dart';
import 'package:zartek/app/models/user_details_model.dart';
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
    GoolgleAuthentication.signInWithGoogle().then(
      (user) {
        if (user != null) {
          USER_DETAILS.value = UserDetails(
            name: user.displayName,
            userId: user.uid,
            phoneNumber: user.phoneNumber,
            userImage: user.photoURL,
          );

          Get.offAndToNamed(Routes.HOME);
        }
      },
    );
  }

  void goToPhoneSignIn() {
    print('Go to sign with phone page.');
  }
}
