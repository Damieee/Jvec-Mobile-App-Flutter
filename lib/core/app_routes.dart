import 'package:jvec_app/presentation/modules/home/account/account_page.dart';
import 'package:jvec_app/presentation/modules/auth/password/new_password_screen.dart';
import 'package:jvec_app/presentation/modules/auth/password/password_controller.dart';
import 'package:jvec_app/presentation/modules/auth/change_password/change_password.dart';
import 'package:jvec_app/presentation/modules/data/purchase_plan/purchase_plan_controller.dart';
import 'package:jvec_app/presentation/modules/data/purchase_plan/purchase_plan_screen.dart';
import 'package:jvec_app/presentation/modules/home/contact/contact_controller.dart';
import 'package:jvec_app/presentation/modules/home/contact/contact_screen.dart';
import 'package:jvec_app/presentation/modules/profile/profile_screen.dart';
import 'package:jvec_app/presentation/modules/wallet/card_payment/cards_controller.dart';
import 'package:jvec_app/presentation/modules/wallet/card_payment/cards_screen.dart';
import 'package:jvec_app/presentation/modules/wallet/fund_wallet/fund_wallet_controller.dart';
import 'package:jvec_app/presentation/modules/wallet/fund_wallet/fund_wallet_screen.dart';
import 'package:jvec_app/presentation/modules/wallet/verify_payment/verify_payment_controller.dart';
import 'package:jvec_app/presentation/modules/wallet/verify_payment/verify_payment_screen.dart';
import 'package:get/get.dart';

import '../domain/repositories/app_repo.dart';
import '../middleware/auth_middleware.dart';
import '../presentation/modules/auth/login/login_controller.dart';
import '../presentation/modules/auth/login/login_screen.dart';
import '../presentation/modules/auth/signup/signup_controller.dart';
import '../presentation/modules/auth/signup/signup_screen.dart';
import '../presentation/modules/auth/change_password/change_password_controller.dart';
import '../presentation/modules/data/buy_data/buy_data_controller.dart';
import '../presentation/modules/data/buy_data/buy_data_screen.dart';
import '../presentation/modules/data/data_plans/data_plan_controller.dart';
import '../presentation/modules/data/data_plans/data_plan_screen.dart';
import '../presentation/modules/home/account/account_controller.dart';
import '../presentation/modules/home/home_controller.dart';
import '../presentation/modules/home/home_screen.dart';
import '../presentation/modules/onboarding/onboarding_screen.dart';
import '../presentation/modules/payment/offline_payment/offline_payment_controller.dart.dart';
import '../presentation/modules/payment/offline_payment/offline_payment_screen.dart';
import '../presentation/modules/payment/offline_payment/qr_code_screen.dart';
import '../presentation/modules/payment/top-up/top_up_controller.dart';
import '../presentation/modules/payment/top-up/top_up_screen.dart';

class Routes {
  // Auth
  static const splash = '/';
  static const onboarding = '/onBoarding';
  static const login = '/login';
  static const resetPassword = '/resetPassword';
  static const signup = '/signup';
  static const otp = '/otp';
  static const passwordOtp = '/passwordOtp';
  static const pinOtp = '/pinOtp';
  static const customerTypeScreen = '/customerTypeScreen';

  static const contact = '/contact';

  // Home
  static const home = '/home';
  static const buyData = '/buy-data';
  static const dataPlan = '/data-plan';
  static const purchasePlan = '/purchase-plan';

  static const fundWallet = '/fundWallet';
  static const verifyPayment = '/verify-payment';
  static const cards = '/cards';

  static const receivePayment = '/receivePayment';
  static const scanCode = '/scanCode';
  static const makePayment = '/makePayment';
  static const topUp = '/topUp';
  static const offlinePay = '/offlinePay';
  static const offlineQrView = '/offlineQrView';
  static const offlineScan = '/offlineScan';

  static const profilePrompt = '/profilePrompt';
  static const profileSetup = '/resturantProfile';
  static const profileVerifying = '/profileVerifying';
  static const newPassword = '/new-password';
  static const dashboard = '/dashboard';

  //Orders
  static const orders = '/orders';
  static const groupOrders = '/groupOrders';
  static const orderDetails = '/orderDetails';
  static const orderSummary = '/orderSummary';
  static const trackOrder = '/trackOrder';
  static const orderReceipt = '/orderReceipt';
  static const cancelOrder = '/cancelOrder';

  // Menus
  static const menu = '/menuScreen';
  static const addMenu = '/addMenuScreen';
  static const addMenuItem = '/addMenuItme';
  static const newMenuItem = '/newMenuItem';
  static const menuItemDetails = '/menuItemDetails';
  static const addOn = '/addOn';
  static const addChoice = '/addChoice';
  static const addSingleChoice = '/addSingleChoice';
  static const dishDetails = '/dishDetails';
  static const newMenuCategory = '/newMenuCategory';

  // Wallet
  static const wallet = '/wallet';
  static const transactions = '/transactions';
  static const earnings = '/earnings';

  static const withdrawal = '/withdrawal';

  // Order history
  static const history = '/history';

  // Settings
  static const settings = '/settings';
  static const editProfile = '/editProfile';
  //static const changePassword = '/changePassword';
  static const withdrawalPin = '/withdrawalPin';
  static const withdrawalAccount = '/withdrawalAccount';
  static const deleteAccount = '/deleteAccount';

  // Resturant
  static const resturant = '/resturant';
  static const dish = '/foodDescription';
  static const fave = '/fave';
  static const manageRestaurant = '/manageRestaurant';
  static const manageRestaurantII = '/manageRestaurantII';

  // Checkout
  static const checkout = '/checkout';
  static const cart = '/cart';

  // Payment
  static const payment = '/payment';

  // Location
  static const savedAddress = '/savedAddress';
  static const newAddress = '/newAddress';
  static const locationPrompt = '/locationPrompt';

  // Customer Orders
  static const customerOrder = '/customerOrder';
  static const customerOrders = '/customerOrders';

  // Filter
  static const dashboardFilter = '/dashboardFilter';
  static const ordersFilter = '/ordersFilter';
  static const searchFilter = '/searchFilter';

  // Communication
  static const calling = '/calling';
  static const chatBox = '/chatBox';
  static const chat = '/chat';

  // Others
  static const notifications = '/notifications';
  static const ratings = '/ratings';
  static const riderRatings = '/riderRratings';
  static const reviews = '/reviews';
  static const helpCenter = '/helpCenter';
  static const exphelpCenter = '/exphelpCenter';
  static const share = '/share';
  static const restaurantRating = '/restaurantRating';

  // Account
  static const accountpage = '/accountpage';
  // Change Password.
  static const changePassword = '/change-password';
  //Profile
  static const editprofile = '/editprofile';
}

// class AuthMiddleware extends GetMiddleware {
//   RouteSettings? redirect(String? route) {
//     String returnUrl = Uri.encodeFull(route ?? '');
//     print(object)
//     return null;
//   }
// }

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.onboarding,
      page: () => OnBoardingScreen(),
    ),
    GetPage(
      name: Routes.buyData,
      page: () => BuyDataScreen(),
      binding: BindingsBuilder(() {
        Get.put(BuyDataController());
      }),
      middlewares: [EnsureAuthMiddleware()],
    ),
    GetPage(
      name: Routes.dataPlan,
      page: () => DataPlanScreen(),
      binding: BindingsBuilder(() {
        Get.put(DataPlanController());
      }),
      middlewares: [EnsureAuthMiddleware()],
    ),
    GetPage(
      name: Routes.purchasePlan,
      page: () => PurchasePlanScreen(),
      binding: BindingsBuilder(() {
        Get.put(PurchasePlanController());
      }),
      middlewares: [EnsureAuthMiddleware()],
    ),
    GetPage(
      name: Routes.fundWallet,
      page: () => FundWalletScreen(),
      binding: BindingsBuilder(() {
        Get.put(FundWalletController());
      }),
      middlewares: [EnsureAuthMiddleware()],
    ),

    GetPage(
      name: Routes.verifyPayment,
      page: () => VerifyPaymentScreen(),
      // middlewares: [AuthMiddleware()],
      binding: BindingsBuilder(() {
        Get.put(VerifyPaymentController());
      }),
      middlewares: [EnsureAuthMiddleware()],
    ),

    GetPage(
      name: Routes.cards,
      page: () => CardsScreen(),
      // middlewares: [AuthMiddleware()],
      binding: BindingsBuilder(() {
        Get.put(CardsSelectionController());
      }),
      middlewares: [EnsureAuthMiddleware()],
    ),

    GetPage(
      name: Routes.newPassword,
      page: () => NewPasswordScreen(),
      // middlewares: [AuthMiddleware()],
      binding: BindingsBuilder(() {
        Get.put(PasswordController());
      }),
      middlewares: [EnsureAuthMiddleware()],
    ),

    //   GetPage(
    //     name: Routes.fave,
    //     page: () => FavouriteScreen(),
    //   ),
    //   GetPage(
    //     name: Routes.customerTypeScreen,
    //     page: () => UserTypeScreen(),
    //   ),
    GetPage(
      name: Routes.login,
      page: () => LoginScreen(),
      binding: BindingsBuilder(() {
        Get.put(LoginController());
      }),
      // middlewares: [EnsureNotAuthedMiddleware()],
    ),

    //   GetPage(
    //       name: Routes.resetPassword,
    //       page: () => ResetPasswordScreen(),
    //       binding: BindingsBuilder(() {
    //         Get.put(PasswordController());
    //       })),
    GetPage(
      name: Routes.signup,
      page: () => SignupScreen(),
      binding: BindingsBuilder(() {
        Get.put(SignupController());
      }),
      // middlewares: [EnsureNotAuthedMiddleware()],
    ),

    //   GetPage(
    //     name: Routes.otp,
    //     page: () => OtpScreen(),
    //     binding: BindingsBuilder(() {
    //       Get.put(OtpController());
    //     }),
    //   ),
    //   GetPage(
    //     name: Routes.passwordOtp,
    //     page: () => ResetPasswordOtpScreen(),
    //     binding: BindingsBuilder(() {
    //       Get.put(OtpController());
    //     }),
    //   ),
    //   GetPage(
    //     name: Routes.pinOtp,
    //     page: () => PinOtpScreen(),
    //     binding: BindingsBuilder(() {
    //       Get.put(PinOtpController());
    //     }),
    //   ),

    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
      transition: Transition.circularReveal,
      binding: BindingsBuilder(() {
        Get.put(AppRepository());
        Get.put(HomeScreenController());
        Get.put(HomePageController());
        Get.put(AccountPageController());
      }),
      middlewares: [EnsureAuthMiddleware()],
    ),

    GetPage(
      name: Routes.topUp,
      page: () => TopUpScreen(),
      // transition: Transition.zoom,
      binding: BindingsBuilder(() {
        Get.put(TopUpController());
      }),
    ),
    GetPage(
      name: Routes.offlinePay,
      page: () => OfflinePaymentScreen(),
      // transition: Transition.zoom,
      binding: BindingsBuilder(() {
        Get.put(OfflinePaymentController());
      }),
    ),
    GetPage(
      name: Routes.offlineQrView,
      page: () => QrCodeScreen(),
      binding: BindingsBuilder(() {
        Get.put(OfflinePaymentController());
      }),
    ),
    // for the accountpage.
    GetPage(
      name: Routes.accountpage,
      page: () => AccountPage(),
    ),
    GetPage(
      name: Routes.changePassword,
      page: () => ChangePasswordScreen(),
      middlewares: [EnsureAuthMiddleware()],
      binding: BindingsBuilder(() {
        Get.put(ChangePasswordController());
      }),
    ),
    GetPage(
      name: Routes.editProfile,
      page: () => EditProfileScreen(),
    ),
    GetPage(
      name: Routes.contact,
      page: () => ContactScreen(),
      middlewares: [EnsureAuthMiddleware()],
      binding: BindingsBuilder(() {
        Get.put(ContactController());
      }),
    ),
  ];
}
