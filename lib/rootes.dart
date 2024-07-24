import 'package:ecommerceproject2/core/constant/appRoutes.dart';
import 'package:ecommerceproject2/core/middleware/appmiddleware.dart';
import 'package:ecommerceproject2/view/screen/accountpage.dart';
import 'package:ecommerceproject2/view/screen/allproductspage.dart';
import 'package:ecommerceproject2/view/screen/auth/ForgetPassword/forgetpassword.dart';

import 'package:ecommerceproject2/view/screen/auth/loginpage.dart';
import 'package:ecommerceproject2/view/screen/auth/ForgetPassword/resetpassword.dart';
import 'package:ecommerceproject2/view/screen/auth/signupPage.dart';
import 'package:ecommerceproject2/view/screen/auth/ForgetPassword/success_resetpassword.dart';
import 'package:ecommerceproject2/view/screen/auth/signupverification.dart';
import 'package:ecommerceproject2/view/screen/auth/success_signup.dart';
import 'package:ecommerceproject2/view/screen/auth/ForgetPassword/verifycode.dart';
import 'package:ecommerceproject2/view/screen/checkout/checkoutpage.dart';

import 'package:ecommerceproject2/view/screen/homescreen.dart';
import 'package:ecommerceproject2/view/screen/notificationspage.dart';
import 'package:ecommerceproject2/view/screen/onboarding.dart';
import 'package:ecommerceproject2/view/screen/ordersdetailspage.dart';
import 'package:ecommerceproject2/view/screen/productpage.dart';

import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  // On Boarding
  GetPage(
      name: "/",
      page: () => const OnBoarding(),
      middlewares: [AppMiddleware()]),
  //Auth
  GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      transition: Transition.cupertino),
  GetPage(
      name: AppRoutes.signup,
      page: () => const SignupPage(),
      transition: Transition.cupertino),
  GetPage(
      name: AppRoutes.signupverify,
      page: () => const SignUpVerification(),
      transition: Transition.cupertino),
  GetPage(
      name: AppRoutes.forgetpassword,
      page: () => const ForgetPasswordPage(),
      transition: Transition.cupertino),
  GetPage(
      name: AppRoutes.verifycode,
      page: () => const VerifyCodePage(),
      transition: Transition.cupertino),
  GetPage(
      name: AppRoutes.resetpassword,
      page: () => const ResetPasswordPage(),
      transition: Transition.cupertino),
  GetPage(
      name: AppRoutes.successResetPassword,
      page: () => const SuccessResetPassword(),
      transition: Transition.cupertino),
  GetPage(
      name: AppRoutes.successSignup,
      page: () => const SuccessSignup(),
      transition: Transition.cupertino),
  // Home
  GetPage(
    name: AppRoutes.home,
    page: () => const HomeScreen(),
    transition: Transition.noTransition,
  ),
  GetPage(
      name: AppRoutes.product,
      page: () => const ProductPage(),
      transition: Transition.cupertino),
  GetPage(
      name: AppRoutes.allproducts,
      page: () => const AllProductsPage(),
      transition: Transition.cupertino),
  GetPage(
      name: AppRoutes.account,
      page: () => const AccountPage(),
      transition: Transition.cupertino),
  GetPage(
      name: AppRoutes.checkout,
      page: () => const CheckOutPage(),
      transition: Transition.cupertino),
  GetPage(
      name: AppRoutes.notifications,
      page: () => const NotificationsPage(),
      transition: Transition.cupertino),
  GetPage(
      name: AppRoutes.ordersdetails,
      page: () => const OrdersDetailsPage(),
      transition: Transition.cupertino),
];
