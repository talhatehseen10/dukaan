import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/seller/address/controllers/customer_address_controller.dart';
import 'package:dukaan/views/seller/my_bag/models/bag_item_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget second(BuildContext context, CustomerAddressController controller) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: Sizes.PADDING_10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Delivery Address",
              style: context.bodySmall.copyWith(
                  fontSize: Sizes.TEXT_SIZE_14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              child: Row(
                children: [
                  Text(
                    "Change",
                    style: context.bodySmall
                        .copyWith(color: AppColors.secondaryColor),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    size: Sizes.ICON_SIZE_24,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.all(Sizes.PADDING_14),
        margin: const EdgeInsets.symmetric(vertical: Sizes.MARGIN_6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
          color: const Color(0xffFFF5EC),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.location_on_outlined,
              size: Sizes.ICON_SIZE_24,
            ),
            const SizedBox(
              width: Sizes.WIDTH_14,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.selectedCustomerAddress!.name ?? "",
                    style:
                        context.bodySmall.copyWith(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Area: ${controller.selectedCustomerAddress!.area}",
                    style:
                        context.bodySmall.copyWith(fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "House No: ${controller.selectedCustomerAddress!.house}",
                    style:
                        context.bodySmall.copyWith(fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Street: ${controller.selectedCustomerAddress!.street}",
                    style:
                        context.bodySmall.copyWith(fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Phone No: ${controller.selectedCustomerAddress!.phone}",
                    style:
                        context.bodySmall.copyWith(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: Sizes.PADDING_10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Order Details",
              style: context.bodySmall.copyWith(
                  fontSize: Sizes.TEXT_SIZE_14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
      ),
      // Container(
      //   padding: const EdgeInsets.symmetric(
      //       horizontal: Sizes.PADDING_24, vertical: Sizes.PADDING_20),
      //   decoration: const BoxDecoration(
      //     color: Color(0xffF9F9F9),
      //   ),
      //   child: Column(
      //     children: [
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           SizedBox(
      //             child: Row(
      //               children: [
      //                 Container(
      //                   height: Sizes.HEIGHT_30,
      //                   width: Sizes.WIDTH_30,
      //                   decoration: BoxDecoration(
      //                     shape: BoxShape.circle,
      //                     border: Border.all(
      //                       color: context.primaryColor,
      //                     ),
      //                     image: const DecorationImage(
      //                         fit: BoxFit.cover,
      //                         image: AssetImage("assets/cart.png")),
      //                   ),
      //                 ),
      //                 const SizedBox(
      //                   width: Sizes.WIDTH_10,
      //                 ),
      //                 Text(
      //                   "",
      //                   style: context.bodySmall
      //                       .copyWith(fontWeight: FontWeight.w700),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           Text(
      //             "Package 1/1",
      //             style: context.bodySmall.copyWith(
      //                 fontWeight: FontWeight.w700,
      //                 color: AppColors.secondaryColor),
      //           ),
      //         ],
      //       ),
      //       Container(
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(Sizes.RADIUS_10),
      //         ),
      //         child: Row(
      //           children: [
      //             Expanded(
      //               child: Container(
      //                 height: Sizes.HEIGHT_110,
      //                 margin: const EdgeInsets.symmetric(
      //                     vertical: Sizes.PADDING_12),
      //                 decoration: BoxDecoration(
      //                   border: Border.all(
      //                     color: context.primaryColor,
      //                   ),
      //                   borderRadius: const BorderRadius.only(
      //                       topLeft: Radius.circular(Sizes.RADIUS_10),
      //                       bottomLeft: Radius.circular(Sizes.RADIUS_10)),
      //                   image: const DecorationImage(
      //                       fit: BoxFit.cover,
      //                       image: AssetImage("assets/cosmetic.png")),
      //                 ),
      //               ),
      //             ),
      //             Expanded(
      //               flex: 2,
      //               child: Container(
      //                 height: Sizes.HEIGHT_110,
      //                 padding: const EdgeInsets.symmetric(
      //                     vertical: Sizes.PADDING_10,
      //                     horizontal: Sizes.PADDING_20),
      //                 decoration: const BoxDecoration(
      //                   color: AppColors.secondaryColor,
      //                   borderRadius: BorderRadius.only(
      //                       topRight: Radius.circular(Sizes.RADIUS_10),
      //                       bottomRight: Radius.circular(Sizes.RADIUS_10)),
      //                 ),
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text(
      //                       "Sploofy PRO - Per Sploofy PRO - Per...",
      //                       style: context.bodySmall.copyWith(
      //                           color: Colors.white,
      //                           fontWeight: FontWeight.w500),
      //                     ),
      //                     Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                       children: [
      //                         Text(
      //                           "Rs. 1330",
      //                           style: context.bodySmall.copyWith(
      //                               color: Colors.white,
      //                               fontWeight: FontWeight.w500),
      //                         ),
      //                         Container(
      //                           height: Sizes.HEIGHT_32,
      //                           width: Sizes.WIDTH_32,
      //                           decoration: BoxDecoration(
      //                               border:
      //                                   Border.all(color: context.primaryColor),
      //                               borderRadius:
      //                                   BorderRadius.circular(Sizes.RADIUS_6)),
      //                           child: const Icon(
      //                             Icons.add_circle,
      //                             size: Sizes.ICON_SIZE_24,
      //                             color: Colors.white,
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       const SizedBox(
      //         height: Sizes.HEIGHT_10,
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text(
      //             "Size:",
      //             style:
      //                 context.bodySmall.copyWith(fontWeight: FontWeight.w500),
      //           ),
      //           Text(
      //             "",
      //             style:
      //                 context.bodySmall.copyWith(fontWeight: FontWeight.w500),
      //           ),
      //         ],
      //       ),
      //       const SizedBox(
      //         height: Sizes.HEIGHT_10,
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text(
      //             "Profit:",
      //             style: context.bodySmall.copyWith(
      //               fontWeight: FontWeight.w500,
      //             ),
      //           ),
      //           Text(
      //             "Rs ",
      //             style: context.bodySmall.copyWith(
      //                 fontWeight: FontWeight.w500,
      //                 color: AppColors.secondaryColor),
      //           ),
      //         ],
      //       ),
      //       const SizedBox(
      //         height: Sizes.HEIGHT_10,
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text(
      //             "Delivery:",
      //             style: context.bodySmall.copyWith(
      //               fontWeight: FontWeight.w500,
      //             ),
      //           ),
      //           Text(
      //             "Rs ",
      //             style: context.bodySmall.copyWith(
      //                 fontWeight: FontWeight.w500,
      //                 color: AppColors.secondaryColor),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // )
      Obx(
        () => controller.orderRefresh.value
            ? Center(
                child: CircularProgressIndicator(
                  color: context.primaryColor,
                ),
              )
            : ListView.separated(
                shrinkWrap: true,
                itemCount: controller.bagItems!.data!.length,
                itemBuilder: (context, index) {
                  BagItemData data = controller.bagItems!.data![index];
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.PADDING_24,
                        vertical: Sizes.PADDING_20),
                    decoration: const BoxDecoration(
                      color: Color(0xffF9F9F9),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: Row(
                                children: [
                                  Container(
                                    height: Sizes.HEIGHT_30,
                                    width: Sizes.WIDTH_30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: context.primaryColor,
                                      ),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          AppAssets.getNetworkImage(
                                              data.vendorImage!),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: Sizes.WIDTH_10,
                                  ),
                                  Text(
                                    data.vendorName ?? "",
                                    style: context.bodySmall
                                        .copyWith(fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Row(
                                children: [
                                  Text(
                                    "Visit Shop",
                                    style: context.bodySmall.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.secondaryColor),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppColors.secondaryColor,
                                    size: Sizes.ICON_SIZE_24,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Sizes.RADIUS_10),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: Sizes.HEIGHT_110,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: Sizes.PADDING_12),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: context.primaryColor,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                        topLeft:
                                            Radius.circular(Sizes.RADIUS_10),
                                        bottomLeft:
                                            Radius.circular(Sizes.RADIUS_10)),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        AppAssets.getNetworkImage(
                                            data.varaiantImgUrl!),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: Sizes.HEIGHT_110,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: Sizes.PADDING_10,
                                      horizontal: Sizes.PADDING_20),
                                  decoration: const BoxDecoration(
                                    color: AppColors.secondaryColor,
                                    borderRadius: BorderRadius.only(
                                        topRight:
                                            Radius.circular(Sizes.RADIUS_10),
                                        bottomRight:
                                            Radius.circular(Sizes.RADIUS_10)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.variantName ?? "",
                                        style: context.bodySmall.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Rs. ${data.variantPrice}",
                                            style: context.bodySmall.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Container(
                                            height: Sizes.HEIGHT_32,
                                            width: Sizes.WIDTH_32,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        context.primaryColor),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Sizes.RADIUS_6)),
                                            child: const Icon(
                                              Icons.add_circle,
                                              size: Sizes.ICON_SIZE_24,
                                              color: Colors.white,
                                            ),
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
                        const SizedBox(
                          height: Sizes.HEIGHT_10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Size:",
                              style: context.bodySmall
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              data.variantSize ?? "",
                              style: context.bodySmall
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: Sizes.HEIGHT_10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Profit:",
                              style: context.bodySmall.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.secondaryColor),
                            ),
                            Text(
                              "Rs ${data.profit}",
                              style: context.bodySmall.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.secondaryColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: Sizes.HEIGHT_10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Price:",
                              style: context.bodySmall.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.secondaryColor),
                            ),
                            Text(
                              "Rs ${data.variantPrice}",
                              style: context.bodySmall.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.secondaryColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: Sizes.HEIGHT_10,
                  );
                },
              ),
      ),
    ],
  );
}
