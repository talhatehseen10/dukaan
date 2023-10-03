import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/themes/controller/theme_controller.dart';
import 'package:dukaan/views/authentication/controllers/login_form_controller.dart';

class ProfileCard extends StatelessWidget {
  final themeController = Get.find<ThemeController>();
  ProfileCard({Key? key, this.onTap}) : super(key: key);

  final loginController = Get.find<LoginFormController>();

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: Sizes.PADDING_30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            color: context.iconColor,
            size: Sizes.ICON_SIZE_30,
          ),
          const SizedBox(
            width: Sizes.WIDTH_12,
          ),
          Icon(
            Icons.notifications_outlined,
            color: context.iconColor,
            size: Sizes.ICON_SIZE_30,
          ),
          const SizedBox(
            width: Sizes.WIDTH_12,
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: Sizes.WIDTH_40,
              height: Sizes.HEIGHT_40,
              decoration: BoxDecoration(
                  color: context.primaryColor,
                  borderRadius: BorderRadius.circular(Sizes.RADIUS_6)),
              child: Obx(
                () => loginController.companyDataRefresh.value
                    ? const SizedBox()
                    : Center(
                        child: Text(
                          "${loginController.selectedCompany!["initial"]}",
                          style: context.bodyLarge.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
              ),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.only(left: Sizes.PADDING_12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enviornment",
                    style: context.bodySmall.copyWith(
                      color: themeController.isDark
                          ? context.bodyMedium.color
                          : AppColors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Obx(
                    () => loginController.companyDataRefresh.value
                        ? const SizedBox()
                        : Center(
                            child: Text(
                              "${loginController.selectedCompany!["environment"]}",
                              style: context.bodySmall,
                            ),
                          ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
