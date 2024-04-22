import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/preferences/preferences.dart';
import 'package:dukaan/views/seller/product/components/product/collection.dart';
import 'package:dukaan/views/seller/product/components/product/item.dart';
import 'package:dukaan/views/seller/product/controllers/product_controller.dart';
import 'package:dukaan/views/seller/custom_navigation_bar/views/custom_navigation_bar.dart';
import 'package:dukaan/widgets/custom_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends GetView<ProductController> {
  const ProductScreen({super.key});

  static const String routeName = "/product";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavigatorBar(),
      appBar: customAppBar(
        title: Preferences().getProdCat(),
        context: context,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_24),
        child: Column(
          children: [
            SizedBox(
              height: Sizes.HEIGHT_30,
              child: DefaultTabController(
                length: 2,
                child: TabBar(
                  labelColor: Colors.black,
                  labelStyle: context.bodyLarge,
                  indicatorColor: const Color(0xffE28631),
                  onTap: (index) {
                    controller.selectedIndex.value = index;
                  },
                  tabs: const [
                    Tab(
                      text: "Items",
                    ),
                    Tab(
                      text: "Collection",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: Sizes.HEIGHT_10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => controller.isLoading.value
                      ? Text(
                          "items",
                          style: context.bodySmall
                              .copyWith(color: const Color(0xff6C6C6C)),
                        )
                      : Text(
                          "${controller.productByCategory!.data![0].products!.length} items",
                          style: context.bodySmall
                              .copyWith(color: const Color(0xff6C6C6C)),
                        ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      const Icon(Icons.filter_alt),
                      Text(
                        "Latest",
                        style: context.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: Sizes.HEIGHT_20,
            ),
            Obx(
              () => controller.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(
                        color: context.primaryColor,
                      ),
                    )
                  : controller.selectedIndex.value == 0
                      ? item(context, controller)
                      : collection(context, controller),
            ),
          ],
        ),
      ),
    );
  }
}
