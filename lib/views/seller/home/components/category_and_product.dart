import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/routes/routes.dart';
import 'package:dukaan/services/api/api_constants.dart';
import 'package:dukaan/views/seller/home/controllers/home_controller.dart';
import 'package:dukaan/views/seller/home/models/data.dart';
import 'package:dukaan/views/seller/home/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

Widget categoryAndProduct(BuildContext context, HomeController controller) {
  return Expanded(
    child: Obx(
      () => controller.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
                color: context.primaryColor,
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(left: Sizes.PADDING_24),
              itemCount: controller.products!.data!.length,
              itemBuilder: (context, outerIndex) {
                Datum data = controller.products!.data![outerIndex];
                return Padding(
                  padding: const EdgeInsets.only(
                    left: Sizes.PADDING_24,
                    right: Sizes.PADDING_24,
                    bottom: Sizes.PADDING_12,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                Text(
                                  data.categoryName!,
                                  style: context.bodySmall,
                                ),
                                const SizedBox(
                                  width: Sizes.WIDTH_12,
                                ),
                                const Icon(
                                  Symbols.share_windows,
                                  color: Colors.orange,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.SEE_ALL);
                            },
                            child: Text(
                              "See all",
                              style: context.bodySmall.copyWith(
                                color: const Color(
                                  0xffE28631,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Sizes.HEIGHT_254,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: data.products!.length,
                            itemBuilder: (context, index) {
                              Product product = data.products![index];
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.PRODUCT_DETAILS,
                                      arguments: [product.productId]);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Sizes.PADDING_2),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(Sizes.RADIUS_10),
                                  ),
                                  width: Sizes.WIDTH_170,
                                  height: Sizes.HEIGHT_246,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: Sizes.HEIGHT_150,
                                        width: Sizes.WIDTH_200,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(
                                              Sizes.RADIUS_10,
                                            ),
                                            topRight: Radius.circular(
                                              Sizes.RADIUS_10,
                                            ),
                                          ),
                                          image: product.productImage == ""
                                              ? const DecorationImage(
                                                  fit: BoxFit.fitWidth,
                                                  image: AssetImage(
                                                      "assets/image.png"),
                                                )
                                              : DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(
                                                      "${ApiConstants.BASE_URL_IMAGE}${product.productImage}"),
                                                ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Color(0xffE28631),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(
                                                Sizes.RADIUS_10,
                                              ),
                                              bottomRight: Radius.circular(
                                                Sizes.RADIUS_10,
                                              ),
                                            ),
                                          ),
                                          padding: const EdgeInsets.all(
                                            Sizes.PADDING_10,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      product.productName!,
                                                      style: context.bodySmall
                                                          .copyWith(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: Sizes.HEIGHT_4,
                                                    ),
                                                    Text(
                                                      "${product.productPrice} PKR",
                                                      style: context.bodySmall
                                                          .copyWith(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: Sizes.HEIGHT_6,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    child: Row(
                                                      children: [
                                                        const Icon(
                                                          Symbols.star_sharp,
                                                          color: Colors.white,
                                                        ),
                                                        Text(
                                                          "5.0",
                                                          style: context
                                                              .bodySmall
                                                              .copyWith(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons.share,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                );
              },
            ),
    ),
  );
}
