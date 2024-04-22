import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/views/notification/controllers/notification_controller.dart';
import 'package:dukaan/views/notification/models/notification_data.dart';
import 'package:dukaan/views/seller/custom_navigation_bar/views/custom_navigation_bar.dart';
import 'package:dukaan/widgets/custom_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notification extends GetView<NotificationController> {
  const Notification({super.key});

  static const String routeName = "/notification";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          backgroundColor: Colors.white,
          context: context,
          title: AppStrings.NOTIFICATION,
          automaticallyImplyLeading: false),
      bottomNavigationBar: const CustomNavigatorBar(),
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  color: context.primaryColor,
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: controller.notification!.data!.length,
                itemBuilder: (context, index) {
                  NotificationData data = controller.notification!.data![index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: Sizes.PADDING_6),
                    child: ListTile(
                      tileColor: Colors.grey.shade50,
                      title: Text(data.content ?? ""),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
