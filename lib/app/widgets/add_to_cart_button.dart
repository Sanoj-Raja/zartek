import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek/app/constants/app_colors.dart';
import 'package:zartek/app/local_storage/cart_session_manger.dart';
import 'package:zartek/app/models/get_foods_response.dart';

class AddToCartButton extends StatelessWidget {
  final CategoryDishes dish;
  AddToCartButton({
    Key? key,
    required this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: Get.width * .36,
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                CartSessionManager.deleteItemFromCart(dish);
              },
              child: Text(
                '-',
                style: Get.textTheme.headline2!.copyWith(
                  color: AppColors.white,
                  fontSize: 26,
                ),
              ),
            ),
            Text(
              CartSessionManager.getQuantityOfDishPresentInCart(dish)
                  .toString(),
              style: Get.textTheme.headline2!.copyWith(
                color: AppColors.white,
                fontSize: 24,
              ),
            ),
            InkWell(
              onTap: () {
                CartSessionManager.addItemToCart(dish);
              },
              child: Text(
                '+',
                style: Get.textTheme.headline2!.copyWith(
                  color: AppColors.white,
                  fontSize: 26,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
