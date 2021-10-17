import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek/app/constants/app_colors.dart';
import 'package:zartek/app/constants/app_strings.dart';
import 'package:zartek/app/models/get_foods_response.dart';
import 'package:zartek/app/widgets/add_to_cart_button.dart';
import 'package:zartek/app/widgets/image_box.dart';
import 'package:zartek/app/widgets/veg_indicator.dart';

class HomeFoodCard extends StatelessWidget {
  final CategoryDishes dishDetails;
  const HomeFoodCard({Key? key, required this.dishDetails}) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageBox(
                    imageUrl: dishDetails.dishImage!,
                    imageContainerSize: 65,
                    borderColor: Colors.transparent,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Get.width * .55,
                        child: Text(
                          dishDetails.dishName!,
                          style: Get.textTheme.headline2!.copyWith(
                            fontSize: 18,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        width: Get.width * .55,
                        child: Text(
                          '${dishDetails.dishCalories} ${AppStrings.calories}',
                          style: Get.textTheme.headline3!.copyWith(
                            color: AppColors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              VegIndicatior(
                isVegetarian: dishDetails.dishType == 2,
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: Get.width,
            child: Text(
              dishDetails.dishDescription!,
              style: Get.textTheme.headline3!.copyWith(
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      '${AppStrings.inr} ${dishDetails.dishPrice}',
                      style: Get.textTheme.headline3!.copyWith(
                        color: AppColors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  if (dishDetails.addonCat!.length > 0)
                    Container(
                      child: Text(
                        AppStrings.customizationAvailable,
                        style: Get.textTheme.headline3!.copyWith(
                          color: Color(0xFFF06292),
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                ],
              ),
              AddToCartButton(),
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
