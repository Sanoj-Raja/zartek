import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek/app/constants/app_colors.dart';
import 'package:zartek/app/constants/app_strings.dart';
import 'package:zartek/app/widgets/veg_indicator.dart';

class SelectedDishCard extends StatelessWidget {
  const SelectedDishCard({Key? key}) : super(key: key);

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
                  'Dish Name: Gobi Manchurian with Dry Salad',
                  style: Get.textTheme.headline2!.copyWith(
                    fontSize: 19,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              VegIndicatior(),
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
                      '320 Calories',
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
                    '${AppStrings.inr} 60.00',
                    style: Get.textTheme.headline3!.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              // AddToCartButton(),
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
