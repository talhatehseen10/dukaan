import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/seller/product/controllers/product_controller.dart';
import 'package:dukaan/views/seller/product/models/product/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

Widget collection(BuildContext context, ProductController controller) {
  return Expanded(
    child: Container(
      width: Get.width * 1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.RADIUS_6),
      ),
      child: ListView.builder(
          itemCount: controller.productByCategory!.data![0].products!.length,
          itemBuilder: (context, index) {
            Product data =
                controller.productByCategory!.data![0].products![index];
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
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(
                          Sizes.RADIUS_10,
                        ),
                        topRight: Radius.circular(
                          Sizes.RADIUS_10,
                        ),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          AppAssets.getNetworkImage(data.productImage!),
                        ),
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
                          data.productName!,
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
                              "${data.productPrice} PKR",
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
