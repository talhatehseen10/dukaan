import 'package:carousel_slider/carousel_slider.dart';
import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/routes/routes.dart';
import 'package:dukaan/views/custom_navigation_bar/views/custom_navigation_bar.dart';
import 'package:dukaan/widgets/custom_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = "/home_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavigatorBar(),
      appBar: customAppBar(
          backgroundColor: Colors.white,
          context: context,
          title: AppStrings.APP_NAME,
          automaticallyImplyLeading: false),
      body: Column(
        children: [
          CarouselSlider(
            items: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade200,
                  borderRadius: BorderRadius.circular(Sizes.RADIUS_6),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/slider_image.jpeg'),
                  ),
                ),
              ),
            ],
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 1.7,
              initialPage: 2,
            ),
          ),
          const SizedBox(
            height: Sizes.HEIGHT_24,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: Sizes.PADDING_24,
              right: Sizes.PADDING_24,
              bottom: Sizes.PADDING_12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      Text(
                        "Beauty Products",
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
          ),
          SizedBox(
            height: Sizes.HEIGHT_254,
            width: double.infinity,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: Sizes.PADDING_24),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (contex, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.PRODUCT_DETAILS);
                  },
                  child: Container(
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
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
