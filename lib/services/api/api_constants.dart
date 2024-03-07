// ignore_for_file: constant_identifier_names, non_constant_identifier_names

class ApiConstants {
  static const String BASE_URL = 'https://app.gudam.pk/api/v1/';

  // AUTHENTICATION API`S
  static String LOGIN = '${BASE_URL}login';
  static String REGISTER = '${BASE_URL}register';

  static String SEND_OTP = '${BASE_URL}generate';
  static String VERIFY_OTP = '${BASE_URL}verifyOtp';
  static String RESEND_OTP = '${BASE_URL}resendOtp';

  static String LOGOUT = '${BASE_URL}logout';

  //VENDOR DASHBOARD
  static String PRODUCTS = '${BASE_URL}products';

  //PRODUCT
  static String ADD_PRODUCT = '${BASE_URL}products';
  static String GET_CAT_UNIT = '${BASE_URL}showUnitsWithProdctCat';
  static String GET_MEASURE_UNIT = '${BASE_URL}getMeasureUnitByProduct';
  static String CREATE_PRODUCT_VARIANT = '${BASE_URL}productVariants';
}
