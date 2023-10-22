// ignore_for_file: constant_identifier_names

part of routes;

class AppRoutes {
  //AUTHENTICATION
  static const String LOGIN = Login.routeName;
  static const String REGISTER = Register.routeName;

  //HOME
  static const String HOME = HomeScreen.routeName;
  static const String SEE_ALL = SeeAllScreen.routeName;

  //CATEGORY
  static const String CATEGORY = CategoryScreen.routeName;
  static const String PRODUCT = ProductScreen.routeName;

  //PRODUCT
  static const String PRODUCT_DETAILS = ProductDetails.routeName;

  //ORDER
  static const String ORDERS = Order.routeName;

  static const String ORDER_DETAILS = OrderDetail.routeName;

  //My BAG
  static const String MY_BAG = MyBag.routeName;

  //PROFILE
  static const String PROFILE = Profile.routeName;

  //ADDRESS 
  static const String CUSTOMER_ADDRESS = CustomerAddress.routeName;

  //CHECKOUT
  static const String CHECK_OUT = CheckOut.routeName;

  //VENDOR ROUTES

  //HOME
  static const String HOME_VENDOR = Home.routeName;

  //PRODUCT
  static const String PRODUCT_VENDOR = Product.routeName;

  //ORDERS
  static const String ORDERS_VENDOR = Orders.routeName;
}
