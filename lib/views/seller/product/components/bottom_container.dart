import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/seller/product/controllers/product_details_controller.dart';
import 'package:dukaan/widgets/custom_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget bottomContainer(
    BuildContext context, ProductDetailsController controller) {
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
            "Rs. ${controller.productVariant!.varPrice}",
            style: context.bodyLarge
                .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
          ),
          trailing: SizedBox(
            width: Sizes.WIDTH_130,
            child: Row(
              children: [
                const Icon(
                  Icons.local_shipping,
                  color: AppColors.secondaryColor,
                  size: Sizes.ICON_SIZE_24,
                ),
                const SizedBox(
                  width: Sizes.WIDTH_4,
                ),
                Text(
                  "Delivery Rs. 100",
                  style: context.bodySmall.copyWith(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w500),
                ),
              ],
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
              child: Obx(
                () => CustomElevatedButton(
                  text: "Place Order",
                  onPressed: controller.varId.value == ""
                      ? null
                      : () {
                          controller.addToBag();
                        },
                ),
              ),
            ),
            const SizedBox(
              width: Sizes.WIDTH_20,
            ),
            Expanded(
              child: CustomElevatedButton(
                text: "Share",
                onPressed: () async {
                  controller.saveNetworkImage();
                },
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
