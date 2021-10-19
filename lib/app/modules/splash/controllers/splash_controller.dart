import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:zartek/app/constants/app_assest.dart';
import 'package:zartek/app/local_storage/cart_session_manger.dart';
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
          print('This is user_name ${user!.displayName}');
          print('This is user_id ${user!.uid}');
          print('This is user_phone_number ${user!.phoneNumber}');
          print('This is user_photo_url ${user!.photoURL}');

          Get.offAndToNamed(Routes.HOME);
        } else
          Get.offAndToNamed(Routes.AUTH);
      },
    );
  }

  @override
  void onClose() {}
}
