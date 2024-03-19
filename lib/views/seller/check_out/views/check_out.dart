import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/widgets/custom_widgets/custom_app_bar.dart';
import 'package:dukaan/widgets/custom_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  static const String routeName = "/check_out";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          title: "Check out",
          backgroundColor: const Color(0xffFFF5EC),
          context: context,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: Sizes.PADDING_10),
              child: Text(
                "2 of 2",
                style: context.bodyLarge.copyWith(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
          automaticallyImplyLeading: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Sizes.PADDING_24, vertical: Sizes.PADDING_20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery Address",
                      style: context.bodySmall
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          Text(
                            "Change",
                            style: context.bodySmall.copyWith(
                                color: AppColors.secondaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: Sizes.ICON_SIZE_24,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: Sizes.HEIGHT_16,
                ),
                Container(
                  padding: const EdgeInsets.all(Sizes.PADDING_14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
                    color: const Color(0xffF9F9F9),
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
                              "Ali Hyder",
                              style: context.bodySmall
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Area: Gulstan Sajjad banglow no c123 house number: near faroque mosque street no: main road hyderabad jagah: near graveyard Phone Number: 03001234567",
                              style: context.bodySmall
                                  .copyWith(fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: Sizes.HEIGHT_20,
                ),
                Text(
                  "Order Details",
                  style: context.bodySmall.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: Sizes.HEIGHT_10,
                ),
                Container(
                  height: Sizes.HEIGHT_320,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xffF9F9F9),
                  ),
                  child: Column(
                    children: [
                      Container(
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
                                          image: const DecorationImage(
                                            fit: BoxFit.cover,
                                            image:
                                                AssetImage("assets/cart.png"),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: Sizes.WIDTH_10,
                                      ),
                                      Text(
                                        "Sam’s Store",
                                        style: context.bodySmall.copyWith(
                                            fontWeight: FontWeight.w700),
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
                                            topLeft: Radius.circular(
                                                Sizes.RADIUS_10),
                                            bottomLeft: Radius.circular(
                                                Sizes.RADIUS_10)),
                                        image: const DecorationImage(
                                          fit: BoxFit.cover,
                                          image:
                                              AssetImage("assets/image2.png"),
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
                                            topRight: Radius.circular(
                                                Sizes.RADIUS_10),
                                            bottomRight: Radius.circular(
                                                Sizes.RADIUS_10)),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Sploofy PRO - Per Sploofy PRO - Per...",
                                            style: context.bodySmall.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Rs. 1330",
                                                style: context.bodySmall
                                                    .copyWith(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                              Container(
                                                height: Sizes.HEIGHT_32,
                                                width: Sizes.WIDTH_32,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: context
                                                            .primaryColor),
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
                                  "150 ml",
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
                                  "Total Whole Sale Price",
                                  style: context.bodySmall
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Rs. 1320",
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
                                  style: context.bodySmall
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Rs. 0",
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
                                  "Delivery:",
                                  style: context.bodySmall
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Rs. 100",
                                  style: context.bodySmall
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
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
                    style: context.bodyLarge.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w700),
                  ),
                  trailing: Text(
                    "Rs. 1340",
                    style: context.bodySmall.copyWith(
                        color: AppColors.secondaryColor,
                        fontSize: Sizes.TEXT_SIZE_20,
                        fontWeight: FontWeight.w600),
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
                        text: "Place Order",
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
