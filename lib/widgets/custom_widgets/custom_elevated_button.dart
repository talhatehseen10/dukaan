import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/themes/controller/theme_controller.dart';
import 'package:dukaan/themes/themes.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(
      {super.key,
      this.onPressed,
      required this.text,
      this.backgoundColor = LightTheme.buttonBackgroundColor,
      this.fontColor = AppColors.white,
      this.size,
      this.screenHeight,
      this.appBarHeight = 0,
      this.statusBarHeight,
      this.height = Sizes.HEIGHT_40,
      this.width = 0.15});

  final themeController = Get.find<ThemeController>();
  final VoidCallback? onPressed;
  final String text;
  final Size? size;
  final Color backgoundColor;
  final Color fontColor;
  final double? screenHeight;
  final double width;
  final double? statusBarHeight;
  final double appBarHeight;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, double.infinity),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.RADIUS_6),
            ),
            backgroundColor: themeController.isDark
                ? context.buttonTextColor
                : backgoundColor),
        onPressed: onPressed,
        child: Text(
          text,
          style: themeController.isDark
              ? context.titleSmall
              : context.titleSmall
                  .copyWith(color: fontColor, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
