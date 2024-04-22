import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/preferences/preferences.dart';
import 'package:dukaan/routes/routes.dart';
import 'package:dukaan/views/seller/category/models/category_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget categoryButton(BuildContext context, CategoryData data) {
  return GestureDetector(
    onTap: () {
      Preferences().setProdCat(data.pcName!);
      Preferences().setCatId(data.id.toString());
      Get.toNamed(
        AppRoutes.PRODUCT,
      );
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: Sizes.PADDING_4),
          height: Sizes.HEIGHT_110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.RADIUS_6),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                AppAssets.getNetworkImage(data.imgUrl!),
              ),
            ),
            border: Border.all(
              color: const Color(0xffD9D9D9),
            ),
          ),
        ),
        const SizedBox(
          height: Sizes.HEIGHT_8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: Sizes.PADDING_2),
          child: Text(
            data.pcName!,
            style: context.bodySmall.copyWith(color: Colors.black),
          ),
        ),
      ],
    ),
  );
}
