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
      backgroundColor: Colors.white,
      onDestinationSelected: (index) {
        controller.changeScreen(index);
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        NavigationDestination(
          icon: Icon(Icons.dashboard),
          label: "Category",
        ),
        NavigationDestination(
          icon: Icon(Symbols.order_play),
          label: "Orders",
        ),
        NavigationDestination(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}
