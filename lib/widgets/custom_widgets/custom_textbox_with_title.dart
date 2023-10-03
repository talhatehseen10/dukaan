import 'package:flutter/material.dart';
import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';

class CustomTextBoxWithTitle extends StatelessWidget {
  final double screenHeight;
  final double statusBarHeight;
  final double appBarHeight;
  final double fieldWidth;
  final String title;
  final String? fieldValue;
  const CustomTextBoxWithTitle(
      {super.key,
      required this.appBarHeight,
      required this.screenHeight,
      required this.statusBarHeight,
      required this.title,
      this.fieldValue,
      required this.fieldWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (screenHeight - statusBarHeight - appBarHeight) * 0.13,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.titleSmall.copyWith(
              color: Colors.black,
            ),
          ),
          Container(
            width: fieldWidth,
            decoration: BoxDecoration(
              color: context.cardColor,
              borderRadius: BorderRadius.circular(Sizes.RADIUS_6),
            ),
            height: (screenHeight - statusBarHeight - appBarHeight) * 0.07,
            child: Center(
              child: Text(
                "$fieldValue",
                style: context.bodyText2.copyWith(
                  color: AppColors.greyShade8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
