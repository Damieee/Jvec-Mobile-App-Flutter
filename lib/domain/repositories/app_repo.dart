import 'package:jvec_app/data/plan/plan.dart';
import 'package:jvec_app/data/user/user.dart';
import 'package:jvec_app/domain/repositories/auth_repo.dart';
import 'package:get/get.dart';

import '../../data/wallet/wallet.dart';
import '../providers/app_api_provider.dart';

class AppRepository {
  AppRepository() {
    Get.put<AppProvider>(AppProvider());
  }

  static AppRepository get instance => Get.find<AppRepository>();

  static User get user => AuthRepository.instance.user.value;

  // static bool get userIsGuest =>
  //     AuthRepository.instance.user.value.type == UserType.guest;

  // static bool get userIsVendor =>
  //     AuthRepository.instance.user.value.type == UserType.vendor;

  // static bool get isAGuest {
  //   if (AppRepository.userIsGuest) {
  //     Get.bottomSheet(GuestBottomSheet());
  //     return true;
  //   }
  //   return false;
  // }

  Future<DebitCards?> cards() => AppProvider.value.cards();

  Future<Plans?> plans() async {
    final result = await AppProvider.value.plans().then((value) =>
        value.where((element) => element.renewable == true).toList());
    // await fetchWallet();
    return result;
  }

  Future<Plan?> user_plan() async {
    final result = await AppProvider.value.user_plan();
    // await fetchWallet();
    return result;
  }

  Future<String> delete_card(int id) async {
    final result = await AppProvider.value.delete_cards(id);
    // await fetchWallet();
    return result;
  }

  Future<FundwalletResponse?> topUp({required num amount, String? type}) async {
    final result = await AppProvider.value.topUp(amount: amount, type: type);
    // final result = await Future.delayed(
    //   Duration(seconds: 3),
    //   () => FundwalletResponse(
    //       reference: 'dsdsd', link: 'https://usefastlink.com'),
    // );
    // await fetchWallet();
    return result;
  }

  Future<String?> claim_free_data() async =>
      AppProvider.value.claim_free_data(email: user.email!);

  Future<VerificationResponse?> verify_payment({
    required String reference,
  }) async {
    final result = await AppProvider.value.verify_payment(reference: reference);
    await AuthRepository.instance.fetchUser();
    return result;
  }

  Future<String?> chargeCard({
    required String authorization_code,
    required String amount,
    required String email,
  }) async {
    final result = await AppProvider.value.chargeCard(
      authorization_code,
      amount,
      email,
    );
    await AuthRepository.instance.fetchUser(amount: amount);
    return result;
  }

//   Future<AddOns> fetchAddons({AddOnType? type}) =>
//       AppProvider.value.fetchAddons(type: type);

//   Future<List<MenuItemDish>> fetchDishes() => AppProvider.value.fetchDishes();
//   Future<List<DishMenuItem>> fetchMenuItems(String menuId) =>
//       AppProvider.value.fetchMenuItems(menuId);
//   Future<DishMenuItem> fetchSingleMenuItem(String itemId) =>
//       AppProvider.value.fetchSingleMenuItem(itemId);

//   Future<String?> deleteDishItem(String itemId) =>
//       AppProvider.value.deleteDishItem(itemId);

//   Future<String?> deleteChoice(String choiceId) =>
//       AppProvider.value.deleteChoice(choiceId);

//   Future<String?> addChoiceToItem(String dishId, DishOptionItem choice) =>
//       AppProvider.value.addChoiceToItem(dishId, choice);
//   Future<String?> updateItemChoice(String dishId, DishOptionItem choice) =>
//       AppProvider.value.updateItemChoice(dishId, choice);

//   Future<List<Cart>?> fetchCartData() => AppProvider.value.fetchCartData();

//   Future<String?> deleteCartItem(String cartItem, String itemId) =>
//       AppProvider.value.deleteCartItem(cartItem, itemId);

//   Future<dynamic> calculateDeliveryFee(
//           {required double vendorLat,
//           required double vendorLong,
//           required double customerLat,
//           required double customerLong}) =>
//       AppProvider.value.calculateDeliveryFee(
//           vendorLat: vendorLat,
//           vendorLong: vendorLong,
//           customerLat: customerLat,
//           customerLong: customerLong);

//   Future<String?> deleteCart(String cartId) => AppProvider.value.deleteCart(
//         cartId,
//       );

//   Future<DishMenuItem> fetchDish(String id) => AppProvider.value.fetchDish(id);

//   Future<RestaurantDetail> fetchRestaurant(String id) =>
//       AppProvider.value.fetchRestaurant(id);

//   Future<RestaurantData> fetchRestaurantData(String id) =>
//       AppProvider.value.fetchRestaurantData(id);

//   Future<dynamic> fetchCartLength() {
//     if (userIsGuest) {
//       return Future.value(0);
//     }
//     return AppProvider.value.fetchCartLength();
//   }

//   Future<VoucherModel> validateVoucher(String code, int amount) =>
//       AppProvider.value.validateVoucher(code, amount);

//   Future<CustomerProfile> fetchCustomerProfile() =>
//       AuthProvider.value.fetchCustomerProfile();

//   Future<VendorProfile> fetchVendorProfile() =>
//       AppProvider.value.fetchVendorProfile();

//   Future<dynamic> payOrder(PayOrderModel payOrderModel) =>
//       AppProvider.value.payOrder(payOrderModel);

//   Future<dynamic> fetchSaveAddress() => AppProvider.value.fetchSavedAddress();

//   Future<customerOrder.OrderData> fetchOrders() =>
//       AppProvider.value.fetchOrders();

//   Future<dynamic> reorderMenu(String orderId) =>
//       AppProvider.value.reorderMenu(orderId);

//   Future<VendorOrdersModel> fetchVendorOrders() =>
//       AppProvider.value.fetchVendorOrders();

//   Future<dynamic> setDefaultAddress(address.Address address) async {
//     final response = await AppProvider.value.setDefaultAddress(address);

//     await AuthRepository.instance.fetchProfile();
//     return response;
//   }

//   Future<bool> deleteAddress(address.Address address) =>
//       AppProvider.value.deleteAddress(address);

//   Future<dynamic> verifyOrderPayment(String paymentRef) =>
//       AppProvider.value.verifyOrderPayment(paymentRef);

//   Future<customerOrder.OrderData> fetchSingleOrder(String orderID) =>
//       AppProvider.value.fetchSingleOrder(orderID);

//   Future<OrderReceipt> fetchOrderReceipt(String orderID) =>
//       AppProvider.value.fetchOrderReceipt(orderID);

//   Future<List<menu.Vendors>> searchMenu({String? query}) =>
//       AppProvider.value.searchMenu(query: query);

//   Future<RestaurantData> fetchVendor(String id) =>
//       AppProvider.value.fetchVendor(id);

//   Future<dynamic> setNotification(bool notif) =>
//       AppProvider.value.setNotification(notif);

//   Future<NotificationModel?> getNotification() {
//     if (userIsGuest)
//       return Future.value(
//         NotificationModel(
//           totalNotification: 0,
//           unreadNotifications: 0,
//           notifications: [],
//         ),
//       );
//     return AppProvider.value.getNotification();
//   }

//   Future<dynamic> setNotificationAsRead(String id) =>
//       AppProvider.value.setNotificationAsRead(id);

//   Future<dynamic> markAllNotifsAsRead() =>
//       AppProvider.value.markAllNotifsAsRead();

//   Future<dynamic> clearAllNotifs() => AppProvider.value.clearAllNotifs();

//   Future<dynamic> delNotification(String id) =>
//       AppProvider.value.delNotification(id);

//   Future<List<Transaction>> fetchTransactions() =>
//       AppProvider.value.fetchTransaction();

//   Future<Sales> fetchSales() => AppProvider.value.fetchSales();

//   Future<WalletModel?> fetchWallet() {
//     if (userIsCustomer) {
//       return AppProvider.value.fetchUserWalletBalance();
//     }
//     return AppProvider.value.fetchWallet();
//   }

//   Future<String?> confirmOrder(String id) => AppProvider.value.confirmOrder(id);

//   Future<String?> rejectOrder(String id) => AppProvider.value.rejectOrder(id);

//   Future<String?> setOrderAwaitingPickup(String id) =>
//       AppProvider.value.setOrderAwaitingPickup(id);

//   Future<String?> completeOrder(String id) =>
//       AppProvider.value.completeOrder(id);

//   Future<dynamic> updateProfile(
//       String name, String email, String phone, String profileImage) async {
//     if (profileImage.isNotEmpty)
//       profileImage = await uploadImage(profileImage) ?? "";
//     return AppProvider.value.updateProfile(name, email, phone, profileImage);
//   }

//   Future<dynamic> uploadToken(String token) async {
//     if (userIsGuest) return null;
//     return AppProvider.value.uploadToken(token);
//   }

//   Future<dynamic> setShopStatus(bool status) =>
//       AppProvider.value.setShopStatus(status);

//   Future<dynamic> setPickUpStatus(bool status) =>
//       AppProvider.value.setPickUpStatus(status);

//   Future<dynamic> setOpeningHours(Map<String, dynamic> openingHours) =>
//       AppProvider.value.setOpeningHours(openingHours);

//   Future<String?> setWithdrawalPin(
//           {required String oldPin, required String newPin}) =>
//       AppProvider.value.setWithdrawalPin(oldPin, newPin);

//   Future<String?> withdrawMoney(String vendorId, String amount, String pin) =>
//       AppProvider.value.withdrawMoney(vendorId, amount, pin);

//   Future<String?> addMenuToFav(String menuId) =>
//       AppProvider.value.addMenuToFav(menuId);

//   Future<String?> removeMenuFromFav(String menuId) =>
//       AppProvider.value.removeMenuFromFav(menuId);

//   Future<String?> cancelOrder(String orderId) =>
//       AppProvider.value.cancelOrder(orderId);

//   Future<FavouriteMenuModel?> fetchFavMenus() =>
//       AppProvider.value.fetchFavMenus();

//   Future<dynamic> setMenu(String id, bool menu) =>
//       AppProvider.value.setMenu(id, menu);

//   Future<dynamic> rateVendor(String orderId, String? review, double rate) =>
//       AppProvider.value.rateVendor(orderId, review, rate);

//   Future<CustomerReviewModel?> fetchVendorReview() =>
//       AppProvider.value.fetchVendorReview();

//   Future<dynamic> rateRider(String riderId, String review, double rate) =>
//       AppProvider.value.rateRider(riderId, review, rate);

//   Future<ConversationModel?> fetchConversation() =>
//       AppProvider.value.fetchConversation();

//   Future<ChatMessageModel?> fetchChatMessage(String riderId) =>
//       AppProvider.value.fetchChatMessage(riderId);

//   Future<String?> markAsRead(String chatId) =>
//       AppProvider.value.markAsRead(chatId);

//   Future<List<HomeCategory>> fetchHomePageDetails() =>
//       AppProvider.value.fetchHomePageDetails();

//   Future<List<HomeCategory>> fetchNearbyVendors() =>
//       AppProvider.value.fetchNearbyVendors();

//   Future<List<HomeCategory>> fetchAllVendors() =>
//       AppProvider.value.fetchAllVendors();

//   Future<List<HomeCategory>> fetchNewlyAdded() =>
//       AppProvider.value.fetchNewlyAdded();
//   Future<List<HomeCategory>> fetchTrendingVendors() =>
//       AppProvider.value.fetchTrendingVendors();

//   Future<List<Vouchers>> fetchVouchers() => AppProvider.value.fetchVouchers();

//   Future<List<HomeCategory>> fetchDiscounts() =>
//       AppProvider.value.fetchDiscounts();

//   Future<String?> suggestRestaurant(
//           String restaurantName, String restaurantLocation) =>
//       AppProvider.value.suggestRestaurant(restaurantName, restaurantLocation);

//   Future<List<HomeCategory>> fetchDiscountedDishes() =>
//       AppProvider.value.fetchDiscountedDishes();

//   Future<List<HomeCategory>> fetchPocketFriendly() =>
//       AppProvider.value.fetchPocketFriendly();

//   Future<dynamic> uploadMenuName(String menuName) =>
//       AppProvider.value.uploadMenuName(menuName);

//   Future<String?> uploadVendorMenu(DishMenu menu) async {
//     if (menu.images.isNotEmpty) {
//       // Uplaod Images

//       final photoUrls = await uploadImages(menu.images);
//       menu.images = photoUrls;
//     }
//     return AppProvider.value.uploadMenuItem(menu);
//   }

//   Future<String?> deleteVendorMenu(String id) async {
//     // Uplaod Images
//     // final photoUrls = await uploadImages(menu.images);

//     // menu.images = photoUrls;

//     return AppProvider.value.deleteMenu(id);
//   }

//   Future<String?> deleteAddon(String id) async {
//     // Uplaod Images
//     // final photoUrls = await uploadImages(menu.images);

//     // menu.images = photoUrls;

//     return AppProvider.value.deleteAddon(id);
//   }

//   Future<String?> editAddon(String id, Map<String, dynamic> data) =>
//       AppProvider.value.editAddon(id, data);

//   Future<String?> editVendorMenu(DishMenuItem menu) async {
//     if (menu.images?.isNotEmpty == true) {
//       // Uplaod Images
//       final photoUrls = await uploadImages(menu.images!);
//       menu.images = photoUrls;
//     }
//     return AppProvider.value.editMenuItem(menu);
//   }
//   // New Menu Upload
//   // Future<String?> createMenu(String path) =>
//   //     AppProvider.value.createMenu(path);

//   Future<String?> uploadAddOn(AddOn addOn) async {
//     // Uplaod Images
//     final photoUrl = await uploadImage(addOn.image!);

//     addOn.image = photoUrl!;

//     return AppProvider.value.uploadAddon(addOn).then(
//       (value) {
//         // Update User
//         return value;
//       },
//     );
//   }

//   Future<dynamic> uploadCategory(MenuCategory category) async {
//     // Uplaod Images
//     // final photoUrl = await uploadImage(category.image!);

//     // category.image = photoUrl!;

//     return AppProvider.value.uploadCategory(category).then(
//       (value) {
//         String categoryId = value['_id'];
//         return categoryId;
//       },
//     );
//   }

//   Future<String?> updateCategory(String categoryId, String newName) async {
//     return AppProvider.value.updateCategory(categoryId, newName).then(
//       (value) {
//         // Update User
//         return value;
//       },
//     );
//   }

//   Future<List<Choices>> fetchExistingChoices() async {
//     return AppProvider.value.fetchExistingChoices().then(
//       (value) {
//         return value;
//       },
//     );
//   }

//   Future<String?> saveExistingChoice(
//       {required String itemId, required List<dynamic> choiceList}) async {
//     return AppProvider.value
//         .saveExistingChoice(itemId: itemId, choiceList: choiceList)
//         .then(
//       (value) {
//         return value;
//       },
//     );
//   }

//   Future<String?> updateMenuName(String menuName, String newName) async {
//     return AppProvider.value.updateMenuName(menuName, newName).then(
//       (value) {
//         // Update User
//         return value;
//       },
//     );
//   }

//   Future<List<String>> uploadImages(List<String> paths) async {
//     final List<String> list = [];

//     for (String path in paths) {
//       if (path.isNotEmpty) list.add(await uploadImage(path) ?? '');
//     }
//     return list;
//   }

//   Future<String?> uploadImage(String path) {
//     if (path.isURL) return Future.value(path);
//     return AppProvider.value.uploadImage(path);
//   }

// //  Future<String?> createMenu(String path) => AppProvider.value.createMenu(path);

//   //  Future<String?> fetchAccountName(
//   //         {required accountNumber, required bankCode}) =>
//   //     AuthProvider.value
//   //         .fetchAccountName(accountNumber: accountNumber, bankCode: bankCode);

//   Future<String?> uploadAddress(address.Address address) {
//     if (userIsGuest) {
//       AuthRepository.instance.user.value =
//           AuthRepository.instance.user.value.copyWith(
//         customerProfile: CustomerProfile(
//           address: address,
//           name: 'Guest',
//           email: 'guest@foodelo.africa',
//         ),
//       );

//       return Future.value('Successfully Saved');
//     }

//     return AuthProvider.value.uploadAddress(address);
//   }

//   Future<List<AddressPrediction>> autocompleteAddress(String address) =>
//       AppProvider.value.autocompleteAddress(address);
//   Future<address.Address> detailsOfPlace(AddressPrediction address) =>
//       AppProvider.value.detailsOfPlace(address);

//   //Future<List<Bank>> fetchBanks() => AuthProvider.value.fetchLogoBanks();

//   Future<String?> addBankAccount(BankAccount account) =>
//       AuthProvider.value.addBankAccount(account);

//   Future<String?> deleteAccount(String reason) =>
//       AppProvider.value.deleteAccount(reason);
}
