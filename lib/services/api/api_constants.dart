// ignore_for_file: constant_identifier_names, non_constant_identifier_names

class ApiConstants {
  static const String BASE_URL_LOGIN = 'https://l.rs74.net/api/v1/';
  static const String BASE_URL = 'https://l.rs74.net/api/v1/';
  static const String MICROSOFT_USER_DATA =
      "https://l.rs74.net/api/v2/getLaravelUserInfo";

  // AUTHENTICATION API'S
  static String LOGIN = '${BASE_URL}salesRepLogin';

  // COMPANY API'S
  static String GET_COMPANY = '${BASE_URL}getCompany';

  // SEARCH RESULT
  static String USER_SEARCH = '${BASE_URL}searchUserName';

  // SALES ORDER API'S
  static String GET_PROCESSED_DATA = '${BASE_URL}getProcessedMBData';
  static String GET_SALES_ORDER = '${BASE_URL}getSalesOrder';
  static String UPLOAD_CSV_MB = '${BASE_URL}uploadCSV';
  static String DELETE_MB_RECORD = '${BASE_URL}deleteCompanyOrder';
  static String ASSIGN_TO = '${BASE_URL}updateSalesOrder';
  static String CREATE_WH_SHIPMENTS = '${BASE_URL}createWhseShipments';
  static String POST_SALES_ORDER = '${BASE_URL}postSalesOrderInvoice';

  static String GET_MATCH_DATA = '${BASE_URL}getMatchData';
  static String GET_CUSTOMER_DATA = '${BASE_URL}fetchCustomer';
  static String GET_CONTACT_DATA = '${BASE_URL}fetchContact';
  static String POST_CUSTOMER = '${BASE_URL}storeCustomer';
  static String POST_CONTACT = '${BASE_URL}storeBcContact';
  static String GET_CUSTOMER_OPTIONS = '${BASE_URL}getCustomerOptions';
  static String CREATE_SALES_ORDER = '${BASE_URL}createSalesOrder';

  //SHIPPING
  static String SEARCH_SALES_ORDER = '${BASE_URL}searchSalesOrder';
  static String VALIDATE_ADDRESS = '${BASE_URL}UpsAddressValidation/1';
  static String UPS_CREATE_SHIPMENT = '${BASE_URL}UpsCreateShipment';
  static String RATE_QUOTE = '${BASE_URL}UpsRating/Shop/';

  // INVENTORY MANAGEMENTS API'S
  static String GET_STOCK_DETAILS = '${BASE_URL}getStockDetails';
}
