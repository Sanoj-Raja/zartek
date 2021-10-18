import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import 'package:zartek/app/constants/app_strings.dart';
import 'package:zartek/app/local_storage/cart_session_manger.dart';
import 'package:zartek/app/models/get_foods_response.dart';

class CheckoutController extends GetxController {
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

  void orderPlaced() {
    if(ITEMS_IN_CART.length > 0) {
    CartSessionManager.clearSession();
    ITEMS_IN_CART.value = <CategoryDishes>[];
    BotToast.showText(text: AppStrings.orderPlacedSuccessfully);
    Get.back();
    }
    else {
      Get.snackbar(AppStrings.cartIsEmpty, AppStrings.addItemInCart,);
    }
  }
}
