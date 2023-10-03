import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/themes/controller/theme_controller.dart';
import 'package:dukaan/widgets/custom_widgets/profile_card.dart';

AppBar customAppBar(
    {required BuildContext context,
    required bool automaticallyImplyLeading,
    String title = "",
    bool customLeading = false,
    Widget? widget,
    void Function()? onTap}) {
  final themeController = Get.find<ThemeController>();
  return AppBar(
    elevation: 0,
    backgroundColor: const Color(0xfff9f9f9),
    automaticallyImplyLeading: true,
    leading: customLeading
        ? widget
        : Padding(
            padding: EdgeInsets.only(left: Get.width * 0.03),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: context.iconColor,
              ),
            ),
          ),
    title: Row(
      children: [
        const SizedBox(
          width: Sizes.WIDTH_50,
        ),
        Text(
          title,
          style: context.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: Sizes.TEXT_SIZE_22,
            color: themeController.isDark
                ? context.bodySmall.color
                : AppColors.black,
          ),
        ),
      ],
    ),
    actions: [
      ProfileCard(
        onTap: onTap,
      ),
    ],
  );
}
