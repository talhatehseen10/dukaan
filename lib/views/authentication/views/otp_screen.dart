import 'dart:async';
import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';
import 'package:dukaan/services/api/api_constants.dart';
import 'package:dukaan/services/api/base_client.dart';
import 'package:dukaan/widgets/custom_widgets/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class OtpAutoFill extends StatefulWidget {
  const OtpAutoFill({Key? key, required this.phoneNumber, required this.userId})
      : super(key: key);

  final String phoneNumber;
  final String userId;
  @override
  State<OtpAutoFill> createState() => _OtpAutoFillState();
}

class _OtpAutoFillState extends State<OtpAutoFill> {
  static const platform = MethodChannel('otp_auto_fill_flutter');
  String otp = '    ', buttonText = 'waiting for SMS...';

  void _smsReadPermission() async {
    // PermissionStatus permissionStatus = await Permission.sms.request();
    if (await Permission.sms.request().isGranted) {
      _initSmsListener();
    }
  }

  Future<void> _initSmsListener() async {
    String? otpSms;
    int? d1, d2, d3, d4;

    try {
      otpSms = await platform.invokeMethod('getSms');
      otpSms = otpSms ?? '';

      if (otpSms.contains('Usama.co')) {
        otpSms = otpSms.substring(0, 4);

        d1 = int.tryParse(otpSms[0]);
        d2 = int.tryParse(otpSms[1]);
        d3 = int.tryParse(otpSms[2]);
        d4 = int.tryParse(otpSms[3]);

        if (d1 != null && d2 != null && d3 != null && d4 != null) {
          otp = '$d1$d2$d3$d4';
        } else {
          otp = '    ';
        }

        buttonText = 'Submit';
        _initSmsListener();
        Future.delayed(const Duration(milliseconds: 100), () {
          setState(() {});
        });
      } else {
        _initSmsListener();
      }
    } on PlatformException {
      buttonText = 'failed to get SMS';
    }
  }

  Future<void> _unRegisterListener() async {
    try {
      await platform.invokeMethod('unregisterListener');
    } on PlatformException {
      debugPrint('exception');
    }
  }

  Future<void> generateOTP() async {
    await BaseClient.safeApiCall(
      ApiConstants.SEND_OTP,
      RequestType.get,
      headers: await BaseClient.generateHeaders(),
      queryParameters: {"phoneNumber": widget.phoneNumber},
      onSuccess: (response) {
        Get.back();
        Get.snackbar(
          "OTP",
          "OTP sent successfully",
          icon: const Icon(
            Icons.check,
            color: Colors.green,
            size: Sizes.ICON_SIZE_20,
          ),
        );
      },
      onLoading: () {
        loadingDialog("Sending OTP..");
      },
      onError: (e) {
        Get.back();
        Get.snackbar(
          "Error",
          "${e.response!.data["msg"]}",
          icon: const Icon(
            Icons.error,
            color: Colors.red,
            size: Sizes.ICON_SIZE_20,
          ),
        );
      },
    );
  }

  Future<void> resendOTP() async {
    await BaseClient.safeApiCall(
      ApiConstants.RESEND_OTP,
      RequestType.get,
      headers: await BaseClient.generateHeaders(),
      queryParameters: {"user_id": widget.userId},
      onSuccess: (response) {
        Get.back();
        Get.snackbar(
          "OTP",
          "OTP sent successfully",
          icon: const Icon(
            Icons.check,
            color: Colors.green,
            size: Sizes.ICON_SIZE_20,
          ),
        );
      },
      onLoading: () {
        loadingDialog("Sending OTP..");
      },
      onError: (e) {
        Get.back();
        Get.snackbar(
          "Error",
          "${e.response!.data["msg"]}",
          icon: const Icon(
            Icons.error,
            color: Colors.red,
            size: Sizes.ICON_SIZE_20,
          ),
        );
      },
    );
  }

  Future<void> verifyOTP(String otp) async {
    await BaseClient.safeApiCall(
      ApiConstants.VERIFY_OTP,
      RequestType.get,
      headers: await BaseClient.generateHeaders(),
      queryParameters: {"user_id": widget.userId, "otp": otp},
      onSuccess: (response) {
        Get.back();
        Get.snackbar(
          "OTP",
          "${response.data["msg"]}",
          icon: const Icon(
            Icons.check,
            color: Colors.green,
            size: Sizes.ICON_SIZE_20,
          ),
        );
      },
      onLoading: () {
        loadingDialog("Sending OTP..");
      },
      onError: (e) {
        Get.back();
        Get.snackbar(
          "Error",
          "${e.response!.data["msg"]}",
          icon: const Icon(
            Icons.error,
            color: Colors.red,
            size: Sizes.ICON_SIZE_20,
          ),
        );
      },
    );
  }

  @override
  void initState() {
    generateOTP();
    _smsReadPermission();
    super.initState();
  }

  @override
  void dispose() {
    _unRegisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.PADDING_30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            Text(
              'Enter Code',
              textAlign: TextAlign.center,
              style: context.bodyLarge.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: Sizes.TEXT_SIZE_24,
                color: AppColors.black,
              ),
            ),
            const SizedBox(
              height: Sizes.HEIGHT_10,
            ),
            Text(
              "We`ve sent an SMS with an activation code to your phone ${widget.phoneNumber}",
              style: context.bodySmall.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: Sizes.HEIGHT_20,
            ),
            const Text(
              'Please wait, your 4 digits code will be filled automatically.',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     OtpDigitContainer(digit: otp[0]),
            //     OtpDigitContainer(digit: otp[1]),
            //     OtpDigitContainer(digit: otp[2]),
            //     OtpDigitContainer(digit: otp[3]),
            //   ],
            // ),
            OtpTextField(
              numberOfFields: 4,
              fieldWidth: Sizes.WIDTH_60,
              borderColor: context.dividerColor,
              borderRadius: BorderRadius.circular(Sizes.RADIUS_10),
              margin: const EdgeInsets.only(right: Sizes.MARGIN_20),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {},
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                verifyOTP(verificationCode);
              }, // end onSubmit
            ),
            const SizedBox(
              height: Sizes.HEIGHT_60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    resendOTP();
                  },
                  child: Text(
                    "Send Code Again",
                    style: context.bodyMedium,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
