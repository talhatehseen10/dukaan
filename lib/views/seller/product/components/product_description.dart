import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/seller/product/controllers/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

Widget productDetail(
    BuildContext context, ProductDetailsController controller) {
  return Obx(
    () => controller.isLoading.value
        ? const SizedBox()
        : Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Sizes.PADDING_28, vertical: Sizes.PADDING_24),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.DESCRIPTION,
                      style: context.bodyLarge
                          .copyWith(color: AppColors.secondaryColor),
                    ),
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(
                          ClipboardData(
                              text: controller
                                  .productDetails!.data!.pDescription!),
                        );
                        Fluttertoast.showToast(
                            msg: "Description Copied",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.white,
                            fontSize: Sizes.TEXT_SIZE_12);
                      },
                      child: const Icon(
                        Icons.content_copy,
                        size: Sizes.ICON_SIZE_24,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: Sizes.HEIGHT_10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Sizes.PADDING_10),
                      child: Text(
                        '\u2022',
                      ),
                    ),
                    Expanded(
                      child: Text(
                        controller.productDetails!.data!.pDescription!,
                        style: context.bodySmall,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: Sizes.HEIGHT_20,
                ),
                Text(
                  AppStrings.RETURN_POLICY,
                  style: context.bodyLarge
                      .copyWith(color: AppColors.secondaryColor),
                ),
                const SizedBox(
                  height: Sizes.HEIGHT_10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Sizes.PADDING_10),
                      child: Text(
                        '\u2022',
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
                        style: context.bodySmall,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
  );
}
