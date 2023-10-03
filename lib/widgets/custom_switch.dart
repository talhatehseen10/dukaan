import 'package:flutter/material.dart';
import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch(
      {super.key,
      required this.label,
      this.switchVal = false,
      required this.onChanged});

  final String label;
  final bool switchVal;
  final Function(bool) onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(Sizes.RADIUS_6),
        border: Border.all(
          color: context.primaryColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: context.labelMedium,
          ),
          Transform.scale(
            scale: 0.7,
            child: Switch(
              value: switchVal,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
