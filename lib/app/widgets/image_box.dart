import 'package:flutter/material.dart';
import 'package:zartek/app/constants/app_colors.dart';

class ImageBox extends StatelessWidget {
  final String imageUrl;
  final double imageContainerSize;
  final double personIconsSize;
  final Color borderColor;
  final double? containerBorderWidth;
  const ImageBox({
    Key? key,
    required this.imageUrl,
    required this.imageContainerSize,
    required this.personIconsSize,
    required this.borderColor,
    this.containerBorderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: imageContainerSize,
      width: imageContainerSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.darkBlue,
        border: Border.all(
          color: borderColor,
          width: containerBorderWidth ?? 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) {
            return Icon(
              Icons.person,
              color: AppColors.lightBlue,
              size: personIconsSize,
            );
          },
        ),
      ),
    );
  }
}