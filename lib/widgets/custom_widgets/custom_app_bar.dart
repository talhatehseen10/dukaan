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
    Color backgroundColor = const Color(0xfff9f9f9),
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
        const [
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
