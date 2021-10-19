import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:zartek/app/constants/app_assest.dart';
import 'package:zartek/app/local_storage/cart_session_manger.dart';
import 'package:zartek/app/local_storage/sessions.dart';
import 'package:zartek/app/models/user_details_model.dart';
import 'package:zartek/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final logo = AppImages.logo;
  User? user = FirebaseAuth.instance.currentUser;

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
        if (user != null) {
          USER_DETAILS.value = UserDetails(
            name: user!.displayName,
            userId: user!.uid,
            phoneNumber: user!.phoneNumber,
            userImage: user!.photoURL,
          );

          Get.offAndToNamed(Routes.HOME);
        } else
          Get.offAndToNamed(Routes.AUTH);
      },
    );
  }

  @override
  void onClose() {}
}
