import 'package:dukaan/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:dukaan/constants/constants.dart';

AppBar customAppBar(
    {required BuildContext context,
    required bool automaticallyImplyLeading,
    String title = "",
    bool customLeading = false,
    Widget? widget,
    Color backgroundColor = const Color(0xffFFF5EC),
    void Function()? onTap,
    List<Widget>? actions,
    bool showLogo = false}) {
  return AppBar(
    elevation: 0,
    backgroundColor: backgroundColor,
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
        showLogo
            ? SvgPicture.asset(
                "assets/logo.svg",
                semanticsLabel: "Gudam Logo",
                height: Sizes.HEIGHT_32,
                width: Sizes.WIDTH_32,
              )
            : Text(
                title,
                style: context.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: Sizes.TEXT_SIZE_22,
                  color: const Color(0xff800000),
                ),
              ),
      ],
    ),
    actions: actions ??
        [
          const Icon(
            Icons.search_rounded,
            color: Colors.black,
            size: Sizes.ICON_SIZE_24,
          ),
          const SizedBox(
            width: Sizes.WIDTH_10,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.NOTIFICATION);
            },
            child: const Icon(
              Icons.notifications_outlined,
              color: Colors.black,
              size: Sizes.ICON_SIZE_24,
            ),
          ),
          const SizedBox(
            width: Sizes.WIDTH_10,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.MY_BAG);
            },
            child: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
              size: Sizes.ICON_SIZE_24,
            ),
          ),
          const SizedBox(
            width: Sizes.WIDTH_10,
          ),
        ],
  );
}
