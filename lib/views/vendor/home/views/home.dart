import 'package:carousel_slider/carousel_slider.dart';
import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/custom_navigation_bar/views/custom_navigation_bar.dart';
import 'package:dukaan/widgets/custom_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static const String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavigatorBar(),
      appBar: customAppBar(
          context: context,
          title: AppStrings.APP_NAME,
          automaticallyImplyLeading: false),
      body: Column(
        children: [
          CarouselSlider(
            items: [
              Container(
                height: Sizes.HEIGHT_200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade200,
                  borderRadius: BorderRadius.circular(Sizes.RADIUS_6),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/slider_image.jpeg"),
                  ),
                ),
              ),
              Container(
                height: Sizes.HEIGHT_200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade200,
                  borderRadius: BorderRadius.circular(Sizes.RADIUS_6),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/slider_image.jpeg"),
                  ),
                ),
              ),
            ],
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              initialPage: 2,
            ),
          ),
          Expanded(
            child: GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: Sizes.PADDING_24),
                itemCount: 5,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2 / 1.8,
                    crossAxisCount: 2,
                    mainAxisSpacing: Sizes.PADDING_16,
                    crossAxisSpacing: Sizes.PADDING_16),
                itemBuilder: (context, index) {
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
                          "Orders \nDelivered",
                          style: context.bodySmall.copyWith(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff6C6C6C),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "24",
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
          const SizedBox(
            height: Sizes.HEIGHT_24,
          ),
        ],
      ),
    );
  }
}
