import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek/app/constants/app_colors.dart';
import 'package:zartek/app/constants/app_strings.dart';
import 'package:zartek/app/models/get_foods_response.dart';
import 'package:zartek/app/widgets/add_to_cart_button.dart';
import 'package:zartek/app/widgets/veg_indicator.dart';

class SelectedDishCard extends StatelessWidget {
  final CategoryDishes dish;
  const SelectedDishCard({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * .86,
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width * .7,
                child: Text(
                  dish.dishName!,
                  style: Get.textTheme.headline2!.copyWith(
                    fontSize: 19,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              VegIndicatior(
                isVegetarian: dish.dishType == 2,
              ),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width * .35,
                    child: Text(
                      '${dish.dishCalories} Calories',
                      style: Get.textTheme.headline3!.copyWith(
                        color: AppColors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '${AppStrings.inr} ${dish.dishPrice}',
                    style: Get.textTheme.headline3!.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              AddToCartButton(dish: dish),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: AppColors.grey,
            thickness: .4,
          ),
        ],
      ),
    );
  }
}
