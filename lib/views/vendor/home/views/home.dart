import 'package:carousel_slider/carousel_slider.dart';
import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/seller/custom_navigation_bar/views/custom_navigation_bar.dart';
import 'package:dukaan/views/vendor/home/controllers/home_controller.dart';
import 'package:dukaan/views/vendor/home/models/metric.dart';
import 'package:dukaan/widgets/custom_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavigatorBar(),
      appBar: customAppBar(
          backgroundColor: Colors.white,
          context: context,
          showLogo: true,
          automaticallyImplyLeading: false,
          actions: [
            const Icon(
              Icons.notifications_none_rounded,
              size: Sizes.ICON_SIZE_30,
            ),
            const SizedBox(
              width: Sizes.WIDTH_10,
            ),
            Container(
              height: Sizes.HEIGHT_30,
              width: Sizes.WIDTH_30,
              margin: const EdgeInsets.only(right: Sizes.MARGIN_16),
              decoration: BoxDecoration(
                border: Border.all(color: context.primaryColor),
                shape: BoxShape.circle,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/cart.png"),
                ),
              ),
            ),
          ]),
      body: Obx(() => controller.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
                color: context.primaryColor,
              ),
            )
          : Column(
              children: [
                CarouselSlider(
                  items: controller.dashboard!.data!.banners!
                      .map((e) => Container(
                            height: Sizes.HEIGHT_200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey.shade200,
                              borderRadius:
                                  BorderRadius.circular(Sizes.RADIUS_6),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image:
                                    NetworkImage(AppAssets.getNetworkImage(e)),
                              ),
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 1.7,
                    initialPage: 2,
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.PADDING_24),
                      itemCount: controller.dashboard!.data!.metrics!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 2 / 1.8,
                              crossAxisCount: 2,
                              mainAxisSpacing: Sizes.PADDING_16,
                              crossAxisSpacing: Sizes.PADDING_16),
                      itemBuilder: (context, index) {
                        Metric data =
                            controller.dashboard!.data!.metrics![index];
                        return Container(
                          height: Sizes.HEIGHT_150,
                          padding: const EdgeInsets.all(Sizes.PADDING_16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Sizes.RADIUS_6),
                            color: Colors.grey.shade200,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data.name ?? "",
                                style: context.bodySmall.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff6C6C6C),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data.value!.toString(),
                                    style: context.titleSmall.copyWith(
                                      fontSize: Sizes.TEXT_SIZE_24,
                                      color: AppColors.secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            )),
    );
  }
}
