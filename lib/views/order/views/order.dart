import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/custom_navigation_bar/views/custom_navigation_bar.dart';
import 'package:dukaan/widgets/custom_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  static const String routeName = "/order";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavigatorBar(),
      appBar: customAppBar(
        title: "Orders",
        context: context,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.PADDING_18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: Sizes.HEIGHT_30,
                    width: Sizes.WIDTH_110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Sizes.RADIUS_8,
                      ),
                      color: const Color(0xffFFE9E9),
                    ),
                    child: Center(
                      child: Text(
                        "In-Progress",
                        style: context.bodySmall
                            .copyWith(color: context.primaryColor),
                      ),
                    ),
                  ),
                  Container(
                    height: Sizes.HEIGHT_30,
                    width: Sizes.WIDTH_110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Sizes.RADIUS_8,
                      ),
                      color: const Color(0xffFFE9E9),
                    ),
                    child: Center(
                      child: Text(
                        "Delivered",
                        style: context.bodySmall
                            .copyWith(color: context.primaryColor),
                      ),
                    ),
                  ),
                  Container(
                    height: Sizes.HEIGHT_30,
                    width: Sizes.WIDTH_110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Sizes.RADIUS_8,
                      ),
                      color: const Color(0xffFFE9E9),
                    ),
                    child: Center(
                      child: Text(
                        "Returned",
                        style: context.bodySmall
                            .copyWith(color: context.primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xff6C6C6C),
              thickness: 0.5,
            ),
            Flexible(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return _itemCard(context);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: Sizes.MARGIN_10),
      height: Sizes.HEIGHT_250,
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
                        children: [
                          Text(
                            "Order# 1235676 (1/1)",
                            style: context.bodySmall.copyWith(
                              fontSize: Sizes.TEXT_SIZE_14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Order Date: 14 Sep, 2023",
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
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(Sizes.PADDING_10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
                color: const Color(0xffF9F9F9),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Item ID: BZ2ASA',
                    style: context.bodySmall.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
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
                          image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/image.png"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Sizes.WIDTH_160,
                              child: Text(
                                "3Pcs women’s Unstiched Lawn Printed Suit",
                                style: context.bodySmall.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
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
                                  "unstitched",
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
                                  "x1",
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
                                        "120",
                                        style: context.bodySmall.copyWith(
                                          color: AppColors.secondaryColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  child: Row(
                                    children: [
                                      Text(
                                        "Chat",
                                        style: context.bodySmall.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.secondaryColor,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.chat_outlined,
                                        size: Sizes.ICON_SIZE_24,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
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
    );
  }
}
