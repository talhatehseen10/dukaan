import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/routes/routes.dart';
import 'package:dukaan/themes/controller/theme_controller.dart';
import 'package:dukaan/views/authentication/controllers/login_form_controller.dart';
import 'package:dukaan/views/custom_navigation_bar/controllers/custom_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization();
  
  runApp(
    const MyApp(),
  );
}

Future initialization() async {
  await GetStorage.init(AppStrings.THEME_BOX_KEY);
  await GetStorage.init().then((value) async {
    Get.lazyPut(() => ThemeController(), fenix: true);
    Get.putAsync(() async => LoginFormController(), permanent: true);
    Get.putAsync(() async => CustomNavigationController(), permanent: true);
  });
}

class MyApp extends GetView<ThemeController> {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
      title: AppStrings.APP_NAME,
      themeMode: ThemeMode.light,
      builder: (context, widget) {
        return AnimatedTheme(
          data: controller.getTheme,
          child: ResponsiveWrapper.builder(
            MediaQuery(
              // prevent font from scaling (some people use big/small device fonts)
              // but we want our app font to still the same and dont get affected..
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: BouncingScrollWrapper.builder(context, widget!),
            ),
            defaultScale: true,
            breakpoints: const [
              ResponsiveBreakpoint.resize(450, name: MOBILE),
              ResponsiveBreakpoint.resize(600, name: TABLET),
              ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ],
          ),
        );
      },
      initialRoute: AppRoutes.LOGIN,
      getPages: AppPages.pages,
      defaultTransition: Transition.cupertino,
      smartManagement: SmartManagement.full,
    );
  }
}
