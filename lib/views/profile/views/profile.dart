import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/custom_navigation_bar/views/custom_navigation_bar.dart';
import 'package:dukaan/views/profile/controllers/profile_controller.dart';
import 'package:dukaan/widgets/custom_widgets/custom_app_bar.dart';
import 'package:dukaan/widgets/custom_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends GetView<ProfileController> {
  const Profile({super.key});

  static const String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          backgroundColor: Colors.white,
          context: context,
          title: AppStrings.APP_NAME,
          automaticallyImplyLeading: false),
      bottomNavigationBar: const CustomNavigatorBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.PADDING_24,
          vertical: Sizes.PADDING_10,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "In Wallet",
                  style: context.bodySmall
                      .copyWith(color: const Color(0xffA7A7A7)),
                ),
              ],
            ),
            const SizedBox(
              height: Sizes.HEIGHT_8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rs. 2134.00",
                  style: context.bodyLarge.copyWith(
                      color: context.primaryColor,
                      fontWeight: FontWeight.w900,
                      fontSize: Sizes.TEXT_SIZE_24),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.secondaryColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      Sizes.RADIUS_8,
                    ),
                  ),
                  child: Obx(() => CustomElevatedButton(
                        text: controller.isProgressBarView.value
                            ? "Hide"
                            : "View",
                        height: Sizes.HEIGHT_36,
                        width: Sizes.WIDTH_130,
                        onPressed: () {
                          controller.isProgressBarView.value =
                              !controller.isProgressBarView.value;
                        },
                        fontColor: AppColors.secondaryColor,
                        backgoundColor: Colors.transparent,
                      )),
                ),
              ],
            ),
            _progressBar(context),
            Row(
              children: [
                Text(
                  "Account",
                  style: context.bodySmall.copyWith(
                    color: context.primaryColor,
                    fontSize: Sizes.TEXT_SIZE_14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: Sizes.HEIGHT_10,
            ),
            _accountOptions(context, "Transactions", Icons.arrow_forward_ios),
            _accountOptions(context, "Payment", Icons.arrow_forward_ios),
            _accountOptions(context, "Favroite", Icons.arrow_forward_ios),
            GestureDetector(
                onTap: () {
                  controller.userLogout();
                },
                child: _accountOptions(context, "Log out", Icons.logout)),
          ],
        ),
      ),
    );
  }

  Widget _accountOptions(
      BuildContext context, String title, IconData iconData) {
    return Container(
      height: Sizes.HEIGHT_30,
      margin: const EdgeInsets.only(bottom: Sizes.MARGIN_10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: context.dividerColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.bodySmall.copyWith(
              color: const Color(0xff6C6C6C),
            ),
          ),
          Icon(
            iconData,
            color: context.iconColor,
            size: Sizes.ICON_SIZE_20,
          ),
        ],
      ),
    );
  }

  Widget _progressBar(BuildContext context) {
    return Obx(
      () => controller.isProgressBarView.value
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.PADDING_30),
              child: SizedBox(
                height: Sizes.HEIGHT_50,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Orders Completed",
                            style: context.bodySmall.copyWith(
                              color: const Color(0xffA7A7A7),
                            ),
                          ),
                          Text(
                            "12",
                            style: context.bodySmall.copyWith(
                                color: AppColors.secondaryColor,
                                fontWeight: FontWeight.w900,
                                fontSize: Sizes.TEXT_SIZE_14),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Profit",
                            style: context.bodySmall.copyWith(
                              color: const Color(0xffA7A7A7),
                            ),
                          ),
                          Text(
                            "Rs. 1763.0",
                            style: context.bodySmall.copyWith(
                                color: const Color(0xffA7A7A7),
                                fontWeight: FontWeight.w900,
                                fontSize: Sizes.TEXT_SIZE_14),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Sales",
                            style: context.bodySmall.copyWith(
                              color: const Color(0xffA7A7A7),
                            ),
                          ),
                          Text(
                            "Rs. 329.0",
                            style: context.bodySmall.copyWith(
                                color: const Color(0xffA7A7A7),
                                fontWeight: FontWeight.w900,
                                fontSize: Sizes.TEXT_SIZE_14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const SizedBox(
              height: Sizes.HEIGHT_30,
            ),
    );
  }
}
