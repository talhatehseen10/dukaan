import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/themes/controller/theme_controller.dart';
import 'package:dukaan/widgets/custom_widgets/custom_elevated_button.dart';

import '../constants/constants.dart';

class CustomFooter extends StatelessWidget {
  final bool showback;
  final double? buttonWidth;
  // ignore: prefer_typing_uninitialized_variables
  final buttonOnTap;
  final double? screenHeight;
  final double? statusBarHeight;
  final double? appBarHeight;
  final bool showRowStart;
  final String buttonTitle;
  // ignore: prefer_typing_uninitialized_variables
  final secondButtonOnTap;
  final String? secondButtonTitle;
  final bool showSecondButton;

  CustomFooter(
      {super.key,
      this.showback = false,
      this.buttonWidth = Sizes.WIDTH_30,
      this.buttonOnTap,
      this.secondButtonOnTap,
      this.secondButtonTitle,
      this.showSecondButton = false,
      this.showRowStart = false,
      this.screenHeight,
      this.appBarHeight,
      this.buttonTitle = AppStrings.APPROVE,
      this.statusBarHeight});
  final controller = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: Sizes.PADDING_10, right: Sizes.PADDING_32),
      child: Row(
        mainAxisAlignment:
            showRowStart ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          SizedBox(
            width: Get.width * 0.15,
            child: CustomElevatedButton(
              onPressed: buttonOnTap,
              text: buttonTitle,
              backgoundColor: context.primaryColor,
            ),
          ),
          const SizedBox(
            width: Sizes.WIDTH_20,
          ),
          showSecondButton
              ? SizedBox(
                  width: Get.width * 0.15,
                  child: CustomElevatedButton(
                    onPressed: secondButtonOnTap,
                    text: "$secondButtonTitle",
                    backgoundColor: context.primaryColor,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
