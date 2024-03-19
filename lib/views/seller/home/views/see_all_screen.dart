import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/seller/custom_navigation_bar/views/custom_navigation_bar.dart';
import 'package:dukaan/widgets/common_text_field.dart';
import 'package:dukaan/widgets/custom_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';

class SeeAllScreen extends StatelessWidget {
  const SeeAllScreen({super.key});

  static const String routeName = "/see_all";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavigatorBar(),
      appBar: customAppBar(
          context: context, title: "Dukaan", automaticallyImplyLeading: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_24),
        child: Column(
          children: [
            CustomTextField(
              borderColor: const Color(0xffFFF5EC),
              prefix: const Icon(
                Icons.search,
                size: Sizes.ICON_SIZE_18,
              ),
              fillColor: const Color(0xffFFF5EC),
              lableText: "Title",
            ),
            const SizedBox(
              height: Sizes.HEIGHT_24,
            ),
            Expanded(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.PADDING_2),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
            ),
          ],
        ),
      ),
    );
  }
}
