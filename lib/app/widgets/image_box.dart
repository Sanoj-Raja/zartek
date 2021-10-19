import 'package:flutter/material.dart';
import 'package:zartek/app/constants/app_colors.dart';

class ImageBox extends StatelessWidget {
  final String imageUrl;
  final double imageContainerSize;
  final Color borderColor;
  final double? containerBorderWidth;
  final bool isBoxCircular;
  const ImageBox({
    Key? key,
    required this.imageUrl,
    required this.imageContainerSize,
    required this.borderColor,
    this.containerBorderWidth,
    this.isBoxCircular = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: imageContainerSize,
      width: imageContainerSize,
      decoration: BoxDecoration(
        shape: isBoxCircular ? BoxShape.circle : BoxShape.rectangle,
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
              Icons.error,
              color: AppColors.white,
              size: imageContainerSize * .9,
            );
          },
        ),
      ),
    );
  }
}
