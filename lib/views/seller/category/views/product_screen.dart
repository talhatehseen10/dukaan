import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/seller/category/controllers/product_controller.dart';
import 'package:dukaan/views/seller/custom_navigation_bar/views/custom_navigation_bar.dart';
import 'package:dukaan/widgets/custom_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';

class ProductScreen extends GetView<ProductController> {
  const ProductScreen({super.key});

  static const String routeName = "/product";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavigatorBar(),
      appBar: customAppBar(
          title: "Necklace", context: context, automaticallyImplyLeading: true),
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
                Text(
                  "12 items",
                  style: context.bodySmall
                      .copyWith(color: const Color(0xff6C6C6C)),
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
              () => controller.selectedIndex.value == 0
                  ? item(context)
                  : collection(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget item(BuildContext context) {
    return Expanded(
      child: Container(
        width: Get.width * 1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.RADIUS_6),
        ),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2 / 3,
              crossAxisCount: 2,
              mainAxisSpacing: Sizes.PADDING_16,
              crossAxisSpacing: Sizes.PADDING_16),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.RADIUS_10),
              ),
              width: Sizes.WIDTH_150,
              height: Sizes.HEIGHT_246,
              child: Column(
                children: [
                  Container(
                    height: Sizes.HEIGHT_150,
                    width: Sizes.WIDTH_200,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          Sizes.RADIUS_10,
                        ),
                        topRight: Radius.circular(
                          Sizes.RADIUS_10,
                        ),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage("assets/image.png"),
                      ),
                    ),
                  ),
                  Container(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "1 Pcs IKI B beauty Product for girls.....",
                          style: context.bodySmall.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: Sizes.HEIGHT_4,
                        ),
                        Text(
                          "1090 PKR",
                          style: context.bodySmall.copyWith(
                            color: Colors.white,
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
                                  const Icon(
                                    Symbols.star_sharp,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "5.0",
                                    style: context.bodySmall
                                        .copyWith(color: Colors.white),
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget collection(BuildContext context) {
    return Expanded(
      child: Container(
        width: Get.width * 1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.RADIUS_6),
        ),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: Sizes.PADDING_2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.RADIUS_10),
                ),
                width: Sizes.WIDTH_150,
                height: Sizes.HEIGHT_246,
                child: Column(
                  children: [
                    Container(
                      height: Sizes.HEIGHT_150,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            Sizes.RADIUS_10,
                          ),
                          topRight: Radius.circular(
                            Sizes.RADIUS_10,
                          ),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/image2.png"),
                        ),
                      ),
                    ),
                    Container(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Symbols.star_sharp,
                                color: Colors.white,
                              ),
                              Icon(
                                Symbols.star_sharp,
                                color: Colors.white,
                              ),
                              Icon(
                                Symbols.star_sharp,
                                color: Colors.white,
                              ),
                              Icon(
                                Symbols.star_rate,
                                color: Colors.white,
                              ),
                              Icon(
                                Symbols.star_sharp,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: Sizes.HEIGHT_4,
                          ),
                          Text(
                            "1 Pcs IKI B beauty Product for girls.....",
                            style: context.bodySmall.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: Sizes.HEIGHT_4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "1090 PKR",
                                style: context.bodySmall.copyWith(
                                  color: Colors.white,
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
                  ],
                ),
              );
            }),
      ),
    );
  }
}
