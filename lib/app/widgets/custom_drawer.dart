import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek/app/constants/app_colors.dart';
import 'package:zartek/app/constants/app_strings.dart';
import 'package:zartek/app/routes/app_pages.dart';
import 'package:zartek/app/widgets/image_box.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [AppColors.darkBlue, AppColors.lightBlue],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ImageBox(
                    imageUrl: '',
                    imageContainerSize: 60,
                    borderColor: Colors.transparent,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: Get.width * .4,
                      child: Text(
                        'Sanoj Raja',
                        style: Get.textTheme.headline2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width * .3,
                    child: Text(
                      'ID: 291',
                      style: Get.textTheme.headline3!
                          .copyWith(color: AppColors.black),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: InkWell(
              onTap: () {
                Get.offAndToNamed(Routes.SPLASH);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.logout_rounded,
                    color: AppColors.grey,
                    size: 35,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    AppStrings.logout,
                    style: Get.textTheme.headline2!.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
