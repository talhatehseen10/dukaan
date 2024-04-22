// ignore_for_file: constant_identifier_names, non_constant_identifier_names

class ApiConstants {
  static const String BASE_URL = 'https://app.gudam.pk';
  static const String BASE_URL_API = '$BASE_URL/api/v1/';
  static const String BASE_URL_IMAGE = '$BASE_URL/public';

  // AUTHENTICATION API`S
  static String LOGIN = '${BASE_URL_API}login';
  static String REGISTER = '${BASE_URL_API}register';

  static String SEND_OTP = '${BASE_URL_API}generate';
  static String VERIFY_OTP = '${BASE_URL_API}verifyOtp';
  static String RESEND_OTP = '${BASE_URL_API}resendOtp';

  static String LOGOUT = '${BASE_URL_API}logout';

  // SELLER PRODUCT
  static String PRODUCT_DETAIL = '${BASE_URL_API}productDetails';

  //VENDOR DASHBOARD
  static String GET_DASHBOARD_METRICS = '${BASE_URL_API}getDashboardMetrics';

  //VENDOR PRODUCTS
  static String PRODUCTS = '${BASE_URL_API}products';

  //PRODUCT
  static String ADD_PRODUCT = '${BASE_URL_API}products';
  static String GET_PRODUCT_BY_CATEGORY = '${BASE_URL_API}products/category/';
  static String GET_CAT_UNIT = '${BASE_URL_API}showUnitsWithProdctCat';
  static String GET_MEASURE_UNIT = '${BASE_URL_API}getMeasureUnitByProduct';
  static String CREATE_PRODUCT_VARIANT = '${BASE_URL_API}productVariants';
  static String CREATE_CATEGORY = '${BASE_URL_API}createCategory';
  static String GET_CATEGORIES = '${BASE_URL_API}getCategories';
  static String GET_CATEGORY = '${BASE_URL_API}getCategory';

  //Bag
  static String ADD_TO_BAG = '${BASE_URL_API}addToBag';
  static String GET_BAG_ITEMS = '${BASE_URL_API}getUserBagItems';
  static String UPDATE_BAG_ITEM_QTY = '${BASE_URL_API}updateBagItemQuantity';

  //CUSTOMER ADDRESS
  static String CUSTOMER = '${BASE_URL_API}customer';
  static String GET_CUSTOMER_ADDRESS = '${BASE_URL_API}getCustomerAddresses';

  //ORDER
  static String GET_ORDERS = '${BASE_URL_API}getOrders';
  static String CREATE_ORDER = '${BASE_URL_API}createOrder';

  //NOTIFICATION
  static String GET_NOTIFICATIONS = '${BASE_URL_API}getNotifications';
}
