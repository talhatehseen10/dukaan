import 'package:carousel_slider/carousel_slider.dart';
import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/views/seller/custom_navigation_bar/views/custom_navigation_bar.dart';
import 'package:dukaan/views/seller/home/components/category_and_product.dart';
import 'package:dukaan/views/seller/home/controllers/home_controller.dart';
import 'package:dukaan/widgets/custom_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
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
          categoryAndProduct(context, controller),
        ],
      ),
    );
  }
}
