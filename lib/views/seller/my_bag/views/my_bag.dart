import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/seller/my_bag/components/bottom_container.dart';
import 'package:dukaan/views/seller/my_bag/components/item_increment.dart';
import 'package:dukaan/views/seller/my_bag/controllers/my_bag_controller.dart';
import 'package:dukaan/views/seller/my_bag/models/bag_item_data.dart';
import 'package:dukaan/widgets/custom_widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBag extends GetView<MyBagController> {
  const MyBag({super.key});

  static const String routeName = "/my_bag";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context, title: "My Bag", automaticallyImplyLeading: true),
      bottomNavigationBar: bottomContainer(context, controller),
      body: Obx(
        () => controller.isLoading.value
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
                                          itemIncrement(context, controller,
                                              addItem: true, data: data)
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
    );
  }
}
