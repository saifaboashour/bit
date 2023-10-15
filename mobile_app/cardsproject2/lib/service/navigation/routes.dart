abstract class Routes {
  //Root
  static const root = '/';
  //Splash
  static const splash = root;
  //Authentication
  static const login = '/auth/login';
  static const register = '/auth/register';
  static const oneTimePassword = '/auth/one-time-password';
  static const forgetPassword = '/auth/forget-password';
  //Home
  static const home = '/home';
  static const categories = '$home/categorie/list';
  static const products = '$home/product/list';
  static const productDetails = '$home/product/view';
  //Notifications
  static const notifications = '/notifications';
  static const notificationDetails = '$notifications/view';
  //Settings
  static const settings = '/settings';
  //Account Settings
  static const editProfile = '$settings/edit-profile';
  static const changePassword = '$settings/change-password';
  //Credit Settings
  static const requestCredit = '$settings/request-credit';
  static const creditHistory = '$settings/credit-history';
  static const changeCurrency = '$settings/change-currency';
  static const requestCreditBankTransfer = '$requestCredit/bank-transfer';
  static const requestCreditPrepaid = '$requestCredit/prepaid';
  static const requestCreditQRCode = '$requestCredit/qr-code';
  static const sendCredit = '$requestCredit/send-credit';
  //App Settings
  static const changeLanguage = '$settings/change-language';
  static const managePrinters = '$settings/manage-printers';
  //Help Settings
  static const support = '$settings/support';
  static const privacyPolicy = '$settings/privacy-policy';
  static const termsAndConditions = '$settings/terms-and-conditions';
}
