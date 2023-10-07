// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:dukaan/constants/constants.dart';
// import 'package:dukaan/extensions/context_extension.dart';
// import 'package:dukaan/themes/themes.dart';
// import 'package:dukaan/views/custom_navigation_bar/controllers/custom_navigation_controller.dart';

// class CustomNavigatorButton extends StatelessWidget {
//   const CustomNavigatorButton({
//     super.key,
//     required this.controller,
//     required this.appRoutes,
//     this.onPressed,
//     required this.iconName,
//     required this.title,
//     this.showExpansionTile = true,
//     this.children = const [],
//   });

//   final void Function()? onPressed;
//   final List<String> appRoutes;
//   final IconData iconName;
//   final String title;
//   final List<String> children;
//   final bool showExpansionTile;
//   final CustomNavigationController controller;

//   @override
//   Widget build(BuildContext context) {
//     return controller.showListTile
//         ? showExpansionTile
//             ? Theme(
//                 data: Theme.of(context)
//                     .copyWith(dividerColor: Colors.transparent),
//                 child: ExpansionTile(
//                   tilePadding:
//                       const EdgeInsets.symmetric(horizontal: Sizes.PADDING_12),
//                   leading: Padding(
//                     padding: const EdgeInsets.only(left: Sizes.PADDING_12),
//                     child: Icon(
//                       iconName,
//                       color: appRoutes.contains(Get.currentRoute)
//                           ? context.primaryColor
//                           : LightTheme.navigationIconColor,
//                       size: Sizes.WIDTH_24,
//                     ),
//                   ),
//                   title: Text(
//                     title,
//                     style: context.bodySmall.copyWith(
//                       fontWeight: FontWeight.w700,
//                       color: appRoutes.contains(Get.currentRoute)
//                           ? context.primaryColor
//                           : AppColors.black,
//                     ),
//                   ),
//                   children: children.isEmpty
//                       ? const [
//                           SizedBox(),
//                         ]
//                       : children
//                           .map(
//                             (e) => Padding(
//                               padding:
//                                   const EdgeInsets.only(left: Sizes.PADDING_50),
//                               child: ListTile(
//                                 onTap: () {},
//                                 title: Text(
//                                   e,
//                                   style: context.bodySmall,
//                                 ),
//                                 trailing: Icon(
//                                   Icons.arrow_forward_ios_rounded,
//                                   color: context.iconColor,
//                                   size: Sizes.WIDTH_14,
//                                 ),
//                               ),
//                             ),
//                           )
//                           .toList(),
//                 ),
//               )
//             : ListTile(
//                 onTap: onPressed,
//                 contentPadding:
//                     const EdgeInsets.symmetric(horizontal: Sizes.PADDING_10),
//                 leading: Padding(
//                   padding: const EdgeInsets.only(left: Sizes.PADDING_14),
//                   child: Icon(
//                     iconName,
//                     color: appRoutes.contains(Get.currentRoute)
//                         ? context.primaryColor
//                         : LightTheme.navigationIconColor,
//                     size: Sizes.WIDTH_24,
//                   ),
//                 ),
//                 title: Text(
//                   title,
//                   style: context.bodySmall.copyWith(
//                     fontWeight: FontWeight.w700,
//                     color: appRoutes.contains(Get.currentRoute)
//                         ? context.primaryColor
//                         : AppColors.black,
//                   ),
//                 ),
//               )
//         : GestureDetector(
//             onTap: onPressed,
//             child: Container(
//               height: Sizes.HEIGHT_50,
//               width: Sizes.WIDTH_50,
//               margin: const EdgeInsets.symmetric(vertical: Sizes.MARGIN_4),
//               decoration: BoxDecoration(
//                   color: appRoutes.contains(Get.currentRoute)
//                       ? context.primaryColor
//                       : Colors.transparent,
//                   borderRadius: BorderRadius.circular(Sizes.RADIUS_6)),
//               child: appRoutes.contains(Get.currentRoute)
//                   ? Center(
//                       child: Icon(
//                         iconName,
//                         color: AppColors.white,
//                         size: Sizes.WIDTH_24,
//                       ),
//                     )
//                   : Center(
//                       child: Icon(
//                         iconName,
//                         color: LightTheme.navigationIconColor,
//                         size: Sizes.WIDTH_24,
//                       ),
//                     ),
//             ),
//           );
//   }
// }
