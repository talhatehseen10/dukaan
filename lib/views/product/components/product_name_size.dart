import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

Widget productNameSize(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_28),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.PADDING_8),
          child: Text(
            "Product Code: BZ2312ASA",
            style: context.bodySmall,
          ),
        ),
        Container(
          height: Sizes.HEIGHT_200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.RADIUS_6),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/product_details.png"),
            ),
          ),
        ),
        const SizedBox(
          height: Sizes.HEIGHT_16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: Get.width * 0.6,
              child: Text(
                "1 Pcs IKI B beauty Product for girls Use",
                style: context.bodyLarge.copyWith(
                    fontSize: Sizes.TEXT_SIZE_20,
                    color: const Color(0xff525A73)),
              ),
            ),
            Row(
              children: [
                Text(
                  "334",
                  style: context.bodySmall.copyWith(
                    color: const Color(0xffE28631),
                  ),
                ),
                const SizedBox(
                  width: Sizes.WIDTH_4,
                ),
                const Icon(
                  Icons.favorite_border,
                  size: Sizes.ICON_SIZE_24,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: Sizes.HEIGHT_10,
        ),
        Text(
          "Delivery in 3-5 days",
          style: context.bodySmall.copyWith(
            color: AppColors.secondaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: Sizes.HEIGHT_8,
        ),
        Row(
          children: [
            RatingBar.builder(
              itemSize: Sizes.ICON_SIZE_24,
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {},
            ),
            Padding(
              padding: const EdgeInsets.only(left: Sizes.PADDING_4),
              child: Text(
                "5.0",
                style: context.bodySmall.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: Sizes.HEIGHT_8,
        ),
        SizedBox(
          height: Sizes.HEIGHT_30,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  height: Sizes.HEIGHT_30,
                  width: Sizes.WIDTH_80,
                  margin: index != 0
                      ? const EdgeInsets.only(left: Sizes.PADDING_10)
                      : EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFE9E9),
                    borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
                  ),
                  child: Center(
                    child: Text(
                      "150 ml",
                      style: context.bodySmall
                          .copyWith(color: context.primaryColor),
                    ),
                  ),
                );
              }),
        ),
      ],
    ),
  );
}
