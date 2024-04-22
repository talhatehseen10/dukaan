import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/services/api/api_constants.dart';
import 'package:dukaan/views/seller/product/controllers/product_details_controller.dart';
import 'package:dukaan/views/seller/product/models/product_variant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

Widget productNameSize(
    BuildContext context, ProductDetailsController controller) {
  return Obx(() => controller.isLoading.value
      ? Center(
          child: CircularProgressIndicator(
            color: context.primaryColor,
          ),
        )
      : Container(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: Sizes.PADDING_8),
              //   child: Text(
              //     "Product Code: BZ2312ASA",
              //     style: context.bodySmall,
              //   ),
              // ),
              Container(
                height: Sizes.HEIGHT_300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.RADIUS_6),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "${ApiConstants.BASE_URL_IMAGE}${controller.productVariant!.image!}"),
                  ),
                ),
              ),
              const SizedBox(
                height: Sizes.HEIGHT_16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      controller.productVariant!.varName!,
                      style: context.bodyLarge.copyWith(
                          fontSize: Sizes.TEXT_SIZE_20,
                          color: const Color(0xff525A73)),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "334",
                        style: context.bodySmall.copyWith(
                          color: const Color(0xffE28631),
                        ),
                      ),
                      const SizedBox(
                        width: Sizes.WIDTH_4,
                      ),
                      const Icon(
                        Icons.favorite_border,
                        size: Sizes.ICON_SIZE_24,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: Sizes.HEIGHT_10,
              ),
              Text(
                "Delivery in 3-5 days",
                style: context.bodySmall.copyWith(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: Sizes.HEIGHT_8,
              ),
              Row(
                children: [
                  RatingBar.builder(
                    itemSize: Sizes.ICON_SIZE_24,
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: Sizes.PADDING_4),
                    child: Text(
                      "5.0",
                      style: context.bodySmall.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: Sizes.HEIGHT_8,
              ),
              SizedBox(
                height: Sizes.HEIGHT_90,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        controller.productDetails!.data!.productVariant!.length,
                    itemBuilder: (context, index) {
                      ProductVariant data = controller
                          .productDetails!.data!.productVariant![index];
                      return GestureDetector(
                        onTap: () {
                          controller.addProductVariant(data);
                        },
                        child: Column(
                          children: [
                            Container(
                              height: Sizes.HEIGHT_60,
                              width: Sizes.WIDTH_60,
                              margin: index != 0
                                  ? const EdgeInsets.only(
                                      left: Sizes.PADDING_10)
                                  : EdgeInsets.zero,
                              decoration: BoxDecoration(
                                border: controller.varId.value == ""
                                    ? null
                                    : Border.all(color: AppColors.black),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        "${ApiConstants.BASE_URL_IMAGE}${data.image}")),
                                borderRadius:
                                    BorderRadius.circular(Sizes.RADIUS_8),
                              ),
                            ),
                            Text(
                              "${data.varMeasurementValue} ${data.varMeasurementUnit!}",
                              style: context.bodySmall
                                  .copyWith(color: context.primaryColor),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
}
