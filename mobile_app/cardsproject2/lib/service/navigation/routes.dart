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
}
