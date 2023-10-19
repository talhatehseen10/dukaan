import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/routes/routes.dart';
import 'package:dukaan/views/custom_navigation_bar/views/custom_navigation_bar.dart';
import 'package:dukaan/widgets/custom_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  static const String routeName = "/category";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavigatorBar(),
      appBar: customAppBar(
          title: "Category",
          context: context,
          automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jewellery",
                style: context.titleMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: Sizes.HEIGHT_10,
              ),
              SizedBox(
                height: Sizes.HEIGHT_140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    categoryButton(context, false),
                    categoryButton(context, false),
                    categoryButton(context, false),
                  ],
                ),
              ),
              const SizedBox(
                height: Sizes.HEIGHT_10,
              ),
              SizedBox(
                height: Sizes.HEIGHT_140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    categoryButton(context, false),
                    categoryButton(context, false),
                    categoryButton(context, false),
                  ],
                ),
              ),
              const SizedBox(
                height: Sizes.HEIGHT_10,
              ),
              Text(
                "Cosmetics",
                style: context.titleMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: Sizes.HEIGHT_10,
              ),
              SizedBox(
                height: Sizes.HEIGHT_140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    categoryButton(context, true),
                    categoryButton(context, true),
                    categoryButton(context, true),
                  ],
                ),
              ),
              const SizedBox(
                height: Sizes.HEIGHT_10,
              ),
              SizedBox(
                height: Sizes.HEIGHT_140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    categoryButton(context, true),
                    categoryButton(context, true),
                    categoryButton(context, true),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryButton(BuildContext context, bool isCosmetic) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.PRODUCT);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Sizes.HEIGHT_110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.RADIUS_6),
              border: Border.all(
                color: const Color(0xffD9D9D9),
              ),
            ),
            child: isCosmetic
                ? Image.asset('assets/cosmetic.png')
                : Image.asset('assets/necklace.png'),
          ),
          const SizedBox(
            height: Sizes.HEIGHT_8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: Sizes.PADDING_2),
            child: Text(
              isCosmetic ? "Hair" : "Necklace",
              style: context.bodySmall.copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
