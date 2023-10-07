import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dukaan/constants/constants.dart';

AppBar customAppBar(
    {required BuildContext context,
    required bool automaticallyImplyLeading,
    String title = "",
    bool customLeading = false,
    Widget? widget,
    void Function()? onTap}) {
  //final themeController = Get.find<ThemeController>();
  return AppBar(
    elevation: 0,
    backgroundColor: const Color(0xfff9f9f9),
    automaticallyImplyLeading: automaticallyImplyLeading,
    leading: automaticallyImplyLeading
        ? GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: context.iconColor,
            ),
          )
        : widget,
    title: Row(
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: Sizes.TEXT_SIZE_22,
            color: const Color(0xff800000),
          ),
        ),
      ],
    ),
    actions: const [
      Icon(
        Icons.search,
        color: Colors.black,
        size: Sizes.ICON_SIZE_24,
      ),
      SizedBox(
        width: Sizes.WIDTH_10,
      ),
      Icon(
        Icons.notifications,
        color: Colors.black,
        size: Sizes.ICON_SIZE_24,
      ),
      SizedBox(
        width: Sizes.WIDTH_10,
      ),
      Icon(
        Icons.shopping_cart,
        color: Colors.black,
        size: Sizes.ICON_SIZE_24,
      ),
      SizedBox(
        width: Sizes.WIDTH_10,
      ),
    ],
  );
}
