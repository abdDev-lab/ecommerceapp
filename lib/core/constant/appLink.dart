// ignore_for_file: file_names

class AppLink {
  static const String server = "https://abdoudevpro.site/Amarcket";

  static const String testlink = "$server/test.php";
  //Images
  static const String imageslink = "$server/images";
  static const String userimageslink = "$server/upload";

  //Auth
  static const String signuplink = "$server/auth/signup.php";
  static const String loginlink = "$server/auth/login.php";
  static const String signupverifylink = "$server/auth/verifycode.php";
  static const String resendCodelink = "$server/auth/resend.php";
  static const String checkemailLink = "$server/forgetpassword/checkemail.php";
  static const String verifycodeLink = "$server/forgetpassword/verifycode.php";
  static const String resetpasswordLink =
      "$server/forgetpassword/resetpassword.php";
  //Home
  static const String homelink = "$server/home.php";
  static const String accountlink = "$server/updateuserdata.php";
  static const String accountlinkforimage =
      "$server/updateuserdatawithimage.php";

  //Search
  static const String searchlink = "$server/product/search.php";
  //Allproducts
  static const String productlink = "$server/product/product.php";
  //favorite
  static const String addfavoratelink = "$server/favorite/addfavorite.php";
  static const String removefavoratelink =
      "$server/favorite/removefavorite.php";
  static const String favorateproductlink = "$server/favorite/viewfavorite.php";
  //Cart
  static const String addCartlink = "$server/cart/addCart.php";
  static const String removeCartlink = "$server/cart/removeCart.php";
  static const String cartlink = "$server/cart/viewCart.php";
  static const String updatecountproductCartlink =
      "$server/cart/updatecountproductCart.php";
  //Checkout
  static const String giftcouponlink = "$server/coupon/giftcoupon.php";
  static const String couponlink = "$server/coupon/checkcoupon.php";
  static const String takeorderslink = "$server/orders/checkout.php";

  //Orders
  static const String orderslink = "$server/orders/orders.php";
  static const String ordersdetails = "$server/orders/ordersdetails.php";
  static const String deleteorders = "$server/orders/deleteorders.php";

  //static const String ordersdetailslink = "$server/orders/ordersdetails.php"

  //Notifications
  static const String notificationslink =
      "$server/notifications/viewnotifications.php";
  static const String notificationsreadlink =
      "$server/notifications/readnotifications.php";
}
