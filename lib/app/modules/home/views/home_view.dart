import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek/app/constants/app_colors.dart';
import 'package:zartek/app/widgets/custom_drawer.dart';
import '../controllers/home_controller.dart';

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
            Obx(
              () => Badge(
                position: BadgePosition.topEnd(top: 5, end: 15),
                animationDuration: Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeContent: Text(
                  controller.itemInCart.value > 9
                      ? '9+'
                      : controller.itemInCart.value.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
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
            ),
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
