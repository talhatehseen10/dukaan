import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/seller/product/controllers/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget vendorDetails(
    BuildContext context, ProductDetailsController controller) {
  return Obx(() => controller.isLoading.value
      ? const SizedBox()
      : Container(
          height: Sizes.HEIGHT_200,
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.all(Sizes.PADDING_20),
          child: Column(
            children: [
              ListTile(
                leading: Container(
                  height: Sizes.HEIGHT_54,
                  width: Sizes.WIDTH_54,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: context.primaryColor),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          controller.productDetails!.data!.vendor!.vImage!),
                    ),
                  ),
                ),
                title: Text(
                  controller.productDetails!.data!.vendor!.vName!,
                  style: context.bodyMedium.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                subtitle: Row(
                  children: [
                    Text(
                      "Visit Shop",
                      style: context.bodyLarge.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.secondaryColor),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: Sizes.ICON_SIZE_20,
                      color: AppColors.secondaryColor,
                    )
                  ],
                ),
                trailing: SizedBox(
                  width: Sizes.WIDTH_80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.CHAT,
                        style: context.bodyLarge,
                      ),
                      const Icon(
                        Icons.message_outlined,
                        color: AppColors.secondaryColor,
                        size: Sizes.ICON_SIZE_20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: Sizes.HEIGHT_20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Sizes.PADDING_20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.star,
                                size: Sizes.ICON_SIZE_24,
                                color: AppColors.secondaryColor,
                              ),
                              const SizedBox(
                                width: Sizes.WIDTH_2,
                              ),
                              Text(
                                controller
                                    .productDetails!.data!.vendor!.vRating!,
                                style: context.bodySmall.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: Sizes.HEIGHT_10,
                          ),
                          Text(
                            "Rating",
                            style: context.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller
                                .productDetails!.data!.vendor!.vFollowers!,
                            style: context.bodySmall.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: Sizes.HEIGHT_10,
                          ),
                          Text(
                            "Followers",
                            style: context.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${controller.productDetails!.data!.vendor!.productsCount}",
                            style: context.bodySmall.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: Sizes.HEIGHT_10,
                          ),
                          Text(
                            "Product",
                            style: context.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
}
