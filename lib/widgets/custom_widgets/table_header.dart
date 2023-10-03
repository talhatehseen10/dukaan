import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/themes/controller/theme_controller.dart';

class TableHeader extends StatelessWidget {
  final double? width;
  final String title;
  final Color? color;
  final bool isLastColumn;
  final int flex;
  final bool isHeader;
  final bool showIcon;
  final Icon? icon;
  final double rowHeight;
  final bool showBorder;

  TableHeader(
      {super.key,
      this.width,
      required this.title,
      this.color,
      this.flex = 1,
      this.isLastColumn = false,
      this.showIcon = false,
      this.icon,
      this.rowHeight = 30,
      this.showBorder = true,
      this.isHeader = false});

  final themeController = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.all(Sizes.PADDING_6),
        width: width,
        height: rowHeight,
        decoration: BoxDecoration(
          border: showBorder
              ? isLastColumn
                  ? Border(
                      bottom: BorderSide(
                        color: context.dividerColor,
                        width: 0.7,
                      ),
                    )
                  : Border(
                      right: BorderSide(
                        color: context.dividerColor,
                        width: 0.7,
                      ),
                      bottom: BorderSide(
                        color: context.dividerColor,
                        width: 0.7,
                      ),
                    )
              : null,
        ),
        child: showIcon
            ? icon
            : SingleChildScrollView(
                child: Text(
                  title,
                  style: themeController.isDark
                      ? context.bodySmall
                      : context.bodySmall.copyWith(
                          color: color,
                          fontWeight:
                              isHeader ? FontWeight.w600 : FontWeight.w400),
                ),
              ),
      ),
    );
  }
}
