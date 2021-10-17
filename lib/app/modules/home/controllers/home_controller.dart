import 'package:get/get.dart';
import 'package:zartek/app/models/get_foods_response.dart';
import 'package:zartek/app/routes/app_pages.dart';
import 'package:zartek/app/services/api_helper.dart';

class HomeController extends GetxController {
  RxInt itemInCart = 0.obs;
  RxList<TableMenuList> tableMenuList = <TableMenuList>[].obs;
  final apiHelper = Get.find<ApiHelper>();

  @override
  void onInit() {
    super.onInit();
    getAllFoodData();
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

  void getAllFoodData() {
    apiHelper.getFoods().then(
      (response) {
        if (response.status.isOk) {
          GetFoodsResponse allFoodsData =
              GetFoodsResponse.fromJson(response.body);
          tableMenuList.value = allFoodsData.tableMenuList!;
        }
      },
    );
  }
}
