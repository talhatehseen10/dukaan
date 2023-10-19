import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dukaan/views/custom_navigation_bar/controllers/custom_navigation_controller.dart';
import 'package:material_symbols_icons/symbols.dart';

class CustomNavigatorBar extends GetView<CustomNavigationController> {
  const CustomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: controller.selectedIndex.value,
      indicatorColor: const Color(0xffF6EDFF),
      backgroundColor: Colors.white,
      onDestinationSelected: (index) {
        controller.changeScreen(index);
      },
      destinations: [
        NavigationDestination(
          selectedIcon: Icon(
            Icons.home,
            color: context.iconColor,
          ),
          icon: const Icon(Icons.home),
          label: "Home",
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.dashboard,
            color: context.iconColor,
          ),
          icon: const Icon(Icons.dashboard),
          label: "Category",
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Symbols.order_play,
            color: context.iconColor,
          ),
          icon: const Icon(Symbols.order_play),
          label: "Orders",
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.person,
            color: context.iconColor,
          ),
          icon: const Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}
