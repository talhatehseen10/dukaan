part of routes;

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const Login(),
      binding: LoginFormBindings(),
    ),
    GetPage(
      name: AppRoutes.REGISTER,
      page: () => const Register(),
      binding: RegisterFormBindings(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}