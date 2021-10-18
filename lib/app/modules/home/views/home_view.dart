import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek/app/constants/app_colors.dart';
import 'package:zartek/app/local_storage/cart_session_manger.dart';
import 'package:zartek/app/widgets/custom_drawer.dart';
import '../controllers/home_controller.dart';
import 'component/home_food_card.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: AppColors.white,
        primaryIconTheme: IconThemeData(
          color: AppColors.grey,
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        drawer: CustomDrawer(),
        appBar: AppBar(
          elevation: 0,
          actions: <Widget>[
            Badge(
              position: BadgePosition.topEnd(top: 5, end: 15),
              animationDuration: Duration(milliseconds: 300),
              animationType: BadgeAnimationType.slide,
              badgeContent: Obx(
                () => Text(
                  ITEMS_IN_CART.length > 9
                      ? '9+'
                      : ITEMS_IN_CART.length.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  size: 30,
                  color: AppColors.grey,
                ),
                padding: EdgeInsets.only(right: 30.0),
                onPressed: controller.goToCart,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 40,
                child: Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.tableMenuList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: InkWell(
                          onTap: () {
                            controller.changeSelectedMenuCategory(index);
                          },
                          child: Obx(
                            () => Container(
                              width: Get.width * .4,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 3,
                                    color: index ==
                                            controller
                                                .selectedMenuCategory.value
                                        ? Color(0xFFF06292)
                                        : AppColors.white,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Container(
                                    width: Get.width * .35,
                                    child: Text(
                                      controller
                                          .tableMenuList[index].menuCategory!,
                                      style: Get.textTheme.headline3!.copyWith(
                                        color: index ==
                                                controller
                                                    .selectedMenuCategory.value
                                            ? Color(0xFFF06292)
                                            : AppColors.grey,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 0,
                      left: 10,
                      right: 10,
                      bottom: 60,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Obx(
                        () => controller.tableMenuList.length > 0
                            ? ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller
                                    .tableMenuList[
                                        controller.selectedMenuCategory.value]
                                    .categoryDishes!
                                    .length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return HomeFoodCard(
                                    dishDetails: controller
                                        .tableMenuList[controller
                                            .selectedMenuCategory.value]
                                        .categoryDishes![index],
                                  );
                                },
                              )
                            : Container(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
