import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek/app/constants/app_colors.dart';
import 'package:zartek/app/constants/app_strings.dart';

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
              foodTypeIndicator(),
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
              Container(
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
                          print('remove quantity');
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
                        '1',
                        style: Get.textTheme.headline2!.copyWith(
                          color: AppColors.white,
                          fontSize: 24,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print('add quantity');
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
              ),
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

  Padding foodTypeIndicator({bool isVegetarian = true}) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Container(
        height: 22,
        width: 22,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
            color: isVegetarian ? Colors.green : Colors.red,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.2),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isVegetarian ? Colors.green : Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
