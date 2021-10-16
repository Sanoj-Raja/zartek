import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek/app/constants/app_colors.dart';
import 'package:zartek/app/constants/app_strings.dart';
import 'package:zartek/app/widgets/large_button.dart';
import '../controllers/checkout_controller.dart';
import 'components/selected_dish_card.dart';

class CheckoutView extends GetView<CheckoutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: LargeButton(
        buttonText: AppStrings.placeOrder,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text(
          AppStrings.orderSummary,
          style: Get.textTheme.headline2!.copyWith(
            color: AppColors.grey,
          ),
        ),
        leading: IconButton(
          onPressed: Get.back,
          icon: Icon(
            Icons.arrow_back,
            size: 25,
            color: AppColors.grey.withOpacity(.7),
          ),
        ),
        centerTitle: false,
      ),
      body: Container(
        height: Get.height - 160,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Container(
                      width: Get.width * .9,
                      color: AppColors.darkBlue,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            '2 - DISHES & 2 - ITEMS',
                            style: Get.textTheme.headline2!.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SelectedDishCard();
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: Get.width * .9,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.totalAmount,
                              style: Get.textTheme.headline2!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '${AppStrings.inr} 760.00',
                              style: Get.textTheme.headline3!.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
