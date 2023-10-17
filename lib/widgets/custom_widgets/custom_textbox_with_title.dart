import 'package:flutter/material.dart';
import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';

class CustomTextBoxWithTitle extends StatelessWidget {
  final double fieldWidth;
  final String title;
  final String? fieldValue;
  const CustomTextBoxWithTitle(
      {super.key,
      required this.title,
      this.fieldValue,
      required this.fieldWidth});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.titleSmall.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: Sizes.HEIGHT_6,
        ),
        Container(
          width: fieldWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color(0xffD8DADC),
            ),
            borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
          ),
          padding: const EdgeInsets.all(Sizes.PADDING_8),
          height: Sizes.HEIGHT_60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$fieldValue",
                style: context.bodyText2.copyWith(
                  color: AppColors.greyShade8,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
