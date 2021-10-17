import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek/app/constants/app_colors.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({Key? key}) : super(key: key);

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
    );
  }
}
