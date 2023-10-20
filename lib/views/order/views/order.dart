import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/custom_navigation_bar/views/custom_navigation_bar.dart';
import 'package:dukaan/widgets/custom_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  static const String routeName = "/order";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavigatorBar(),
      appBar: customAppBar(
        title: "Orders",
        context: context,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.PADDING_18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: Sizes.HEIGHT_30,
                    width: Sizes.WIDTH_110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Sizes.RADIUS_8,
                      ),
                      color: const Color(0xffFFE9E9),
                    ),
                    child: Center(
                      child: Text(
                        "In-Progress",
                        style: context.bodySmall
                            .copyWith(color: context.primaryColor),
                      ),
                    ),
                  ),
                  Container(
                    height: Sizes.HEIGHT_30,
                    width: Sizes.WIDTH_110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Sizes.RADIUS_8,
                      ),
                      color: const Color(0xffFFE9E9),
                    ),
                    child: Center(
                      child: Text(
                        "Delivered",
                        style: context.bodySmall
                            .copyWith(color: context.primaryColor),
                      ),
                    ),
                  ),
                  Container(
                    height: Sizes.HEIGHT_30,
                    width: Sizes.WIDTH_110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Sizes.RADIUS_8,
                      ),
                      color: const Color(0xffFFE9E9),
                    ),
                    child: Center(
                      child: Text(
                        "Returned",
                        style: context.bodySmall
                            .copyWith(color: context.primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xff6C6C6C),
              thickness: 0.5,
            ),
            Flexible(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:
                          const EdgeInsets.symmetric(vertical: Sizes.MARGIN_10),
                      height: Sizes.HEIGHT_100,
                      width: double.infinity,
                      color: Colors.amber,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
