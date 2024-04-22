import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/routes/routes.dart';
import 'package:dukaan/views/seller/my_bag/controllers/my_bag_controller.dart';
import 'package:dukaan/widgets/custom_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget bottomContainer(BuildContext context, MyBagController controller) {
  return Container(
    height: Sizes.HEIGHT_210,
    color: const Color(0xffFFF5EC),
    padding: const EdgeInsets.symmetric(
      horizontal: Sizes.PADDING_28,
      vertical: Sizes.PADDING_24,
    ),
    child: Column(
      children: [
        ListTile(
          leading: Text(
            "Customer Price",
            style: context.bodyLarge
                .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
          ),
          trailing: Obx(
            () => Text(
              "Rs. ${controller.totalPrice}",
              style: context.bodySmall.copyWith(
                  color: AppColors.secondaryColor,
                  fontSize: Sizes.TEXT_SIZE_20,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(
          height: Sizes.HEIGHT_20,
        ),
        const Divider(
          thickness: 0.5,
        ),
        const SizedBox(
          height: Sizes.HEIGHT_24,
        ),
        Row(
          children: [
            Expanded(
              child: CustomElevatedButton(
                text: "Proceed To Checkout",
                onPressed: () {
                  Get.toNamed(AppRoutes.CUSTOMER_ADDRESS);
                },
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
