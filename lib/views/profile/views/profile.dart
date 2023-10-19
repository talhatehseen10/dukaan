import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/custom_navigation_bar/views/custom_navigation_bar.dart';
import 'package:dukaan/widgets/custom_widgets/custom_app_bar.dart';
import 'package:dukaan/widgets/custom_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  static const String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
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
                  child: CustomElevatedButton(
                    text: "View",
                    height: Sizes.HEIGHT_36,
                    width: Sizes.WIDTH_130,
                    onPressed: () {},
                    fontColor: AppColors.secondaryColor,
                    backgoundColor: Colors.transparent,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: Sizes.HEIGHT_30,
            ),
            Row(
              children: [
                Text(
                  "Account",
                  style: context.bodySmall.copyWith(
                    color: context.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: Sizes.HEIGHT_10,
            ),
          ],
        ),
      ),
    );
  }
}
