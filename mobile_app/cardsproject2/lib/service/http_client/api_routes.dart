class ApiRoutes {
  //General
  static const countriesUrl = "/api/countries";
  //Authentication
  static const registerUrl = "/api/clients/auth/register";
  static const loginUrl = "/api/clients/auth/login";
  static const oneTimePasswordUrl = "/api/clients/auth/otp";
  static const userProfile = '/api/clients';
  //Home
  static const newsUrl = '/api/clients/news';
  static const typesUrl = '/api/types';
  static const categoriesUrl = '/api/types/::typeId::/categories';
  static const subCategoriesUrl = '/api/categories/::categoryId::/subcategories';
  static const productsUrl = '/api/subcategories/::subcategoryId::/products';
  static const productDetailsUrl = '/api/products/::productId::';
  static const purchaseUrl = '/api/clients/orders';
  static const uploadOrderImageUrl = '/api/clients/orders/upload';
  //Notifications
  static const notifications = '/api/clients/notifications?page=';
  //Orders
  static const orders = '/api/clients/orders?page=';
  //Settings
  //Credit Request
  static const supportedAccounts = '/api/supportedAccounts';
  static const currenciesUrl = '/api/currencies';
  static const requestCreditBankTransferUrl = '/api/clients/credits/request';
  static const requestCreditPrepaidUrl = '/api/clients/credits/prepaid';
  static const creditRequestHistoryUrl = '/api/clients/credits';
  //Account Settings
  static const profileUrl = '/api/clients';
  static const changePasswordUrl = '/api/clients/changePassword';
  //Help Settings
  static const privacyPolicyUrl = '/api/clients/privacy_policy';
  static const termsAndConditionsUrl = '/api/clients/terms_and_conditions';
  static const issueTypesUrl = '/api/issueTypes';
  static const issuesUrl = '/api/clients/issues';
}
