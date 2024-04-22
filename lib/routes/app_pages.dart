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
    GetPage(
      name: AppRoutes.CATEGORY,
      page: () => const CategoryScreen(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: AppRoutes.SEE_ALL,
      page: () => const SeeAllScreen(),
      binding: SeeAllBinding(),
    ),
    GetPage(
      name: AppRoutes.PRODUCT,
      page: () => const ProductScreen(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: AppRoutes.PRODUCT_DETAILS,
      page: () => const ProductDetails(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: AppRoutes.ORDER_DETAILS,
      page: () => const OrderDetail(),
      binding: OrderDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.MY_BAG,
      page: () => const MyBag(),
      binding: MyBagBinding(),
    ),
    GetPage(
      name: AppRoutes.PROFILE,
      page: () => const Profile(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.CUSTOMER_ADDRESS,
      page: () => const CustomerAddress(),
      binding: CustomerAddressBinding(),
    ),
    GetPage(
      name: AppRoutes.CHECK_OUT,
      page: () => const CheckOut(),
      binding: CheckOutBinding(),
    ),
    GetPage(
      name: AppRoutes.ORDERS,
      page: () => const Order(),
      binding: OrderBinding(),
    ),
    //VENDOR SECTION
    GetPage(
      name: AppRoutes.HOME_VENDOR,
      page: () => const Home(),
      binding: HomeVendorBinding(),
    ),
    GetPage(
      name: AppRoutes.PRODUCT_VENDOR,
      page: () => const Product(),
      binding: ProductVendorBinding(),
    ),
    GetPage(
      name: AppRoutes.ADD_PRODUCT_VENDOR,
      page: () => const AddProduct(),
      binding: AddProductVendorBinding(),
    ),
    GetPage(
      name: AppRoutes.ORDERS_VENDOR,
      page: () => const Orders(),
      binding: OrderVendorBinding(),
    ),
    GetPage(
      name: AppRoutes.NOTIFICATION,
      page: () => const Notification(),
      binding: NotificationBinding(),
    ),
  ];
}
