import 'package:dukaan/widgets/common_text_field.dart';
import 'package:flutter/material.dart';

class OtpDigitContainer extends StatelessWidget {
  const OtpDigitContainer({Key? key, required this.digit}) : super(key: key);

  final String digit;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
      child: Container(
        width: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(color: AppColors.black),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Center(
          child: CustomTextField(
            keyboaredtype: TextInputType.number,
          ),
        ),
      ),
    );
  }
}
