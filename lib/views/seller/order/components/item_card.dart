import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/seller/order/models/order_data.dart';
import 'package:dukaan/views/seller/order/models/order_item.dart';
import 'package:flutter/material.dart';

Widget itemCard(BuildContext context, OrderData data) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: Sizes.MARGIN_10),
    width: double.infinity,
    decoration: BoxDecoration(
      color: const Color(0xffFFF5EC),
      borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
    ),
    child: Column(
      children: [
        Container(
          height: Sizes.HEIGHT_74,
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.PADDING_10, vertical: Sizes.PADDING_10),
          decoration: const BoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Container(
                      height: Sizes.HEIGHT_46,
                      width: Sizes.WIDTH_46,
                      margin: const EdgeInsets.only(right: Sizes.PADDING_8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: context.primaryColor),
                        image: const DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage("assets/cart.png"),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order# ${data.orderId}",
                          style: context.bodySmall.copyWith(
                            fontSize: Sizes.TEXT_SIZE_14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Order Date: ${data.orderDate}",
                          style: context.bodySmall.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Row(
                  children: [
                    Text(
                      "Track",
                      style: context.bodySmall.copyWith(
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: Sizes.TEXT_SIZE_14),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.secondaryColor,
                      size: Sizes.ICON_SIZE_24,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: data.orderItems!.length,
          itemBuilder: (context, index) {
            OrderItem orderItem = data.orderItems![index];
            return Container(
              padding: const EdgeInsets.all(Sizes.PADDING_10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
                color: const Color(0xffF9F9F9),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   'Item ID: BZ2ASA',
                  //   style: context.bodySmall.copyWith(
                  //     fontWeight: FontWeight.w400,
                  //   ),
                  // ),
                  const SizedBox(
                    height: Sizes.HEIGHT_6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: Sizes.HEIGHT_100,
                        width: Sizes.WIDTH_100,
                        margin: const EdgeInsets.only(right: Sizes.MARGIN_10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizes.RADIUS_6),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(AppAssets.getNetworkImage(
                                orderItem.varImgUrl!)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              orderItem.varName ?? "",
                              style: context.bodySmall.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: Sizes.HEIGHT_14,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Size: ",
                                  style: context.bodySmall.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  orderItem.measurementUnit ?? "",
                                  style: context.bodySmall.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: Sizes.HEIGHT_6,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Quality: ",
                                  style: context.bodySmall.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  orderItem.measurementValue ?? "",
                                  style: context.bodySmall.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: Sizes.HEIGHT_6,
                            ),
                            SizedBox(
                              child: Row(
                                children: [
                                  Text(
                                    "Price: ",
                                    style: context.bodySmall.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.secondaryColor,
                                    ),
                                  ),
                                  Text(
                                    orderItem.varPrice ?? "",
                                    style: context.bodySmall.copyWith(
                                      color: AppColors.secondaryColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: Sizes.HEIGHT_6,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child: Row(
                                    children: [
                                      Text(
                                        "Profit: ",
                                        style: context.bodySmall.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.secondaryColor,
                                        ),
                                      ),
                                      Text(
                                        orderItem.varProfit ?? "",
                                        style: context.bodySmall.copyWith(
                                          color: AppColors.secondaryColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // SizedBox(
                                //   child: Row(
                                //     children: [
                                //       Text(
                                //         "Chat",
                                //         style: context.bodySmall.copyWith(
                                //           fontWeight: FontWeight.w500,
                                //           color: AppColors.secondaryColor,
                                //         ),
                                //       ),
                                //       const Icon(
                                //         Icons.chat_outlined,
                                //         size: Sizes.ICON_SIZE_24,
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        )
      ],
    ),
  );
}
