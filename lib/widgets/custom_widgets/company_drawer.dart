// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:dukaan/extensions/context_extension.dart';
// import 'package:dukaan/widgets/common_text_field.dart';
// import 'package:dukaan/widgets/custom_widgets/custom_elevated_button.dart';

// import '../../constants/constants.dart';

// class CompanyDrawer extends StatelessWidget {
//   const CompanyDrawer({
//     super.key,
//     required this.scaffoldKey,
//   });

//   final GlobalKey<ScaffoldState> scaffoldKey;

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => controller.loginController.companyDataRefresh.value
//           ? Center(
//               child: CircularProgressIndicator(
//                 color: context.primaryColor,
//               ),
//             )
//           : Container(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: Sizes.PADDING_30,
//               ),
//               height: double.infinity,
//               width: Sizes.WIDTH_430,
//               color: const Color(0xFFFAF9F8),
//               child: Column(
//                 children: [
//                   ListTile(
//                     contentPadding: const EdgeInsets.symmetric(
//                         vertical: Sizes.PADDING_22,
//                         horizontal: Sizes.PADDING_23),
//                     title: Text(
//                       "Available Companies",
//                       style: context.titleMedium.copyWith(
//                         fontSize: Sizes.TEXT_SIZE_28,
//                         color: AppColors.black,
//                       ),
//                     ),
//                     trailing: GestureDetector(
//                       onTap: () {
//                         scaffoldKey.currentState!.closeEndDrawer();
//                       },
//                       child: Icon(
//                         Icons.close,
//                         color: context.iconColor1,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: Sizes.WIDTH_350,
//                     child: CustomTextField(
//                       hintText: AppStrings.SEARCH,
//                     ),
//                   ),
//                   Theme(
//                     data: Theme.of(context)
//                         .copyWith(dividerColor: Colors.transparent),
//                     child: ExpansionTile(
//                       initiallyExpanded: true,
//                       title: Text(
//                         "Sandbox",
//                         style: context.bodyLarge,
//                       ),
//                       children: List.generate(
//                         controller.loginController.companyData!.sandbox!.length,
//                         (index) => controller.loginController.showSwitchTile ==
//                                     controller.loginController.companyData!
//                                         .sandbox![index].id &&
//                                 controller.loginController
//                                         .selectedCompany!['id'] !=
//                                     controller.loginController.companyData!
//                                         .sandbox![index].id
//                             ? Container(
//                                 color: const Color(0xffD9F0F2),
//                                 child: ListTile(
//                                   leading: Container(
//                                     decoration: BoxDecoration(
//                                       color: context.primaryColor,
//                                       borderRadius:
//                                           BorderRadius.circular(Sizes.RADIUS_6),
//                                     ),
//                                     height: Sizes.HEIGHT_36,
//                                     width: Sizes.WIDTH_36,
//                                     child: Center(
//                                       child: Text(
//                                         "${controller.loginController.companyData!.sandbox![index].nameInitials}",
//                                         style: context.bodyLarge
//                                             .copyWith(color: AppColors.white),
//                                       ),
//                                     ),
//                                   ),
//                                   title: Text(
//                                     "${controller.loginController.companyData!.sandbox![index].displayName}",
//                                     style: context.bodyLarge,
//                                   ),
//                                   trailing: Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: Sizes.PADDING_8,
//                                         bottom: Sizes.PADDING_8),
//                                     child: CustomElevatedButton(
//                                       width: Sizes.WIDTH_100,
//                                       text: "Switch",
//                                       onPressed: () {
//                                         controller.loginController
//                                             .selectCompany(controller
//                                                 .loginController
//                                                 .companyData!
//                                                 .sandbox![index]);
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             : ListTile(
//                                 onTap: () {
//                                   controller.loginController.showSwicth(
//                                       controller.loginController.companyData!
//                                           .sandbox![index].id!);
//                                 },
//                                 leading: Container(
//                                   decoration: BoxDecoration(
//                                     color: context.primaryColor,
//                                     borderRadius:
//                                         BorderRadius.circular(Sizes.RADIUS_6),
//                                   ),
//                                   height: Sizes.HEIGHT_36,
//                                   width: Sizes.WIDTH_36,
//                                   child: Center(
//                                     child: Text(
//                                       "${controller.loginController.companyData!.sandbox![index].nameInitials}",
//                                       style: context.bodyLarge
//                                           .copyWith(color: AppColors.white),
//                                     ),
//                                   ),
//                                 ),
//                                 title: Text(
//                                   "${controller.loginController.companyData!.sandbox![index].displayName}",
//                                   style: context.bodyLarge,
//                                 ),
//                                 trailing: controller.loginController
//                                             .selectedCompany!['id'] ==
//                                         controller.loginController.companyData!
//                                             .sandbox![index].id
//                                     ? Icon(
//                                         Icons.check,
//                                         color: context.iconColor,
//                                       )
//                                     : const SizedBox(),
//                               ),
//                       ),
//                     ),
//                   ),
//                   Theme(
//                     data: Theme.of(context)
//                         .copyWith(dividerColor: Colors.transparent),
//                     child: ExpansionTile(
//                       initiallyExpanded: true,
//                       title: Text(
//                         "Production",
//                         style: context.bodyLarge,
//                       ),
//                       children: List.generate(
//                         controller
//                             .loginController.companyData!.production!.length,
//                         (index) => controller.loginController.showSwitchTile ==
//                                     controller.loginController.companyData!
//                                         .production![index].id &&
//                                 controller.loginController
//                                         .selectedCompany!['id'] !=
//                                     controller.loginController.companyData!
//                                         .production![index].id
//                             ? Container(
//                                 color: const Color(0xffD9F0F2),
//                                 child: ListTile(
//                                   leading: Container(
//                                     decoration: BoxDecoration(
//                                       color: context.primaryColor,
//                                       borderRadius:
//                                           BorderRadius.circular(Sizes.RADIUS_6),
//                                     ),
//                                     height: Sizes.HEIGHT_36,
//                                     width: Sizes.WIDTH_36,
//                                     child: Center(
//                                       child: Text(
//                                         "${controller.loginController.companyData!.sandbox![index].nameInitials}",
//                                         style: context.bodyLarge
//                                             .copyWith(color: AppColors.white),
//                                       ),
//                                     ),
//                                   ),
//                                   title: Text(
//                                     "${controller.loginController.companyData!.production![index].displayName}",
//                                     style: context.bodyLarge,
//                                   ),
//                                   trailing: Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: Sizes.PADDING_8,
//                                         bottom: Sizes.PADDING_8),
//                                     child: CustomElevatedButton(
//                                       width: Sizes.WIDTH_100,
//                                       text: "Switch",
//                                       onPressed: () {
//                                         controller.loginController
//                                             .selectCompany(controller
//                                                 .loginController
//                                                 .companyData!
//                                                 .production![index]);
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             : ListTile(
//                                 onTap: () {
//                                   controller.loginController.showSwicth(
//                                       controller.loginController.companyData!
//                                           .production![index].id!);
//                                 },
//                                 leading: Container(
//                                   decoration: BoxDecoration(
//                                     color: context.primaryColor,
//                                     borderRadius:
//                                         BorderRadius.circular(Sizes.RADIUS_6),
//                                   ),
//                                   height: Sizes.HEIGHT_36,
//                                   width: Sizes.WIDTH_36,
//                                   child: Center(
//                                     child: Text(
//                                       "${controller.loginController.companyData!.production![index].nameInitials}",
//                                       style: context.bodyLarge
//                                           .copyWith(color: AppColors.white),
//                                     ),
//                                   ),
//                                 ),
//                                 title: Text(
//                                   "${controller.loginController.companyData!.production![index].displayName}",
//                                   style: context.bodyLarge,
//                                 ),
//                                 trailing: controller.loginController
//                                             .selectedCompany!["id"] ==
//                                         controller.loginController.companyData!
//                                             .production![index].id
//                                     ? Icon(
//                                         Icons.check,
//                                         color: context.iconColor,
//                                       )
//                                     : const SizedBox(),
//                               ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }
