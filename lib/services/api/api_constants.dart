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
  static String PRODUCTS = '${BASE_URL_API}products';

  //PRODUCT
  static String ADD_PRODUCT = '${BASE_URL_API}products';
  static String GET_CAT_UNIT = '${BASE_URL_API}showUnitsWithProdctCat';
  static String GET_MEASURE_UNIT = '${BASE_URL_API}getMeasureUnitByProduct';
  static String CREATE_PRODUCT_VARIANT = '${BASE_URL_API}productVariants';
}
