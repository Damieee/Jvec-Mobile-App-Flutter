import 'dart:async';

import '../../core/app_routes.dart';
import '../../data/user/user.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../app_shared_prefs.dart';
import '../providers/auth_api_provider.dart';

class AuthRepository {
  final user = User.zero().obs;

  bool get isAuthenticated => user.value.token != null;

  AuthRepository() {
    user.value = AppSharedPrefs.instance.user ?? User.zero();

    // Attach listener to store user in DB
    ever<User>(user, (freshUser) {
      // print("New User: ${freshUser.toJson()}");
      AppSharedPrefs.instance.setUser(freshUser);
    });
  }

  static AuthRepository get instance => Get.find<AuthRepository>();

  // set userType(UserType userType) {
  //   user.value = user.value.copyWith(type: userType);
  // }

  // UserType get userType => user.value.type;

  // static Address? get guestAddress =>
  //     instance.user.value.customerProfile?.address;

  // set email(String email) {
  //   user.value = user.value.copyWith(email: email);
  // }

  // User Data

  // Authentication data

  // Future<String?> uploadImage(String path) =>
  //     AppProvider.value.uploadImage(path);

  // Future<String?> updateRestaurantProfile(String path) =>
  //     AuthProvider.value.updateRestaurantProfile(path);

  // Future<String?> fetchAccountName(
  //         {required accountNumber, required bankCode}) =>
  //     AuthProvider.value
  //         .fetchAccountName(accountNumber: accountNumber, bankCode: bankCode);

  //New Fetch Account Details
  Future<UserCredentials?> get user_credentials async {
    // 1 Check if password is present locally
    // 2 Get password from server if not present

    final credentials = AppSharedPrefs.instance.getObject('credentials');

    if (credentials != null) {
      return UserCredentials.fromJson(credentials);
    }

    // else get password from server
    final password = await AuthProvider.value.get_code();

    if (password != null) {
      // Save the password
      AppSharedPrefs.instance.saveObject('credentials',
          UserCredentials(email: user.value.email!, password: password));

      // Return the credentials
      return UserCredentials(email: user.value.email!, password: password);
    }

    return Future.value();
  }

  Future<String?> setPassword({
    required String otp,
    required String password,
  }) =>
      AuthProvider.value.setPassword(user.value.email!, password, otp);

  Future<String?> resetPassword({
    required String otp,
    required String email,
    required String newPassword,
  }) =>
      AuthProvider.value.resetPassword(user.value.email!, newPassword, otp);

  Future<String?> changePassword(
      {required String oldPassword, required String newPassword}) async {
    final response =
        await AuthProvider.value.changePassword(oldPassword, newPassword);

    // save the new password
    if (response != null) {
      // Save the password
      AppSharedPrefs.instance.saveObject('credentials',
          UserCredentials(email: user.value.email!, password: newPassword));
    }

    return response;
  }

/* 
  Future<String?> forgetPassword({String? email}) async {
    final String response;
    if (email?.contains('@foodelo.africa') ?? false) appDebugMode.value = true;

    if (email != null) {
      response = await AuthProvider.value.forgotPassword(email);

      this.email = email;
    } else {
      response = await AuthProvider.value.forgotPassword(user.value.email!);
    }

    return response;
  }
 */

  Future<String?> submitPinOtp(String otp) =>
      AuthProvider.value.submitPinOtp(otp);

  Future<String?> sendPinOtp() => AuthProvider.value.sendPinOtp();

  // Future<String?> resendOtp({String? email}) async {
  //   final String response;

  //   if (email != null) {
  //     response = await AuthProvider.value.resendOtp(email);
  //     this.email = email;
  //   } else {
  //     response = await AuthProvider.value.resendOtp(user.value.email!);
  //   }
  //   return response;
  // }

  Future<String?> login({identifier, password}) async {
    if (identifier.contains('@foodelo.africa')) {
      appDebugMode.value = true;
    }

    final Token response = await AuthProvider.value.login(
      identifier: identifier,
      password: password,
    );

    user.value = user.value.copyWith(token: response);
    // final user_data = await AuthProvider.value.fetchUserData();
    // user.value = response.copyWith(data: user_data);

    return Future.value('Success');
  }

  Future<String?> signup({email, password, name, surname, phone}) async {
    if (email.contains('@foodelo.africa')) {
      appDebugMode.value = true;
    }

    return await AuthProvider.value.signup(
      email: email,
      password: password,
      name: name,
      surname: surname,
      phone: phone,
    );
  }

  Future<String?> save_contact({
    required String first_name,
    required String last_name,
    required String phone_number,
  }) =>
      AuthProvider.value.save_contact(first_name, last_name, phone_number);

  Future<Contacts?> get_contacts() {
    return AuthProvider.value.get_contacts();
  }


  Future<User> fetchUser({String? amount}) async {
    User user = await AuthProvider.value.fetchUser();

    if (this.user.value.balance == user.balance && amount != null) {
      user = user.copyWith(balance: user.balance + int.parse(amount));
    }

    final user_data = await AuthProvider.value.fetchUserData();
    this.user.value =
        user.copyWith(data: user_data, token: this.user.value.token);
    return user;
  }

  Future<dynamic> uploadToken(String token) async {
    return AuthProvider.value.uploadToken(token);
  }

  Future<String?> payMoney({required String id, required num amount}) async {
    final result = await AuthProvider.value.payMoney(id: id, amount: amount);
    // await fetchWallet();
    return result;
  }

  Future<String?> topUp({required num amount}) async {
    final result = await AuthProvider.value.topUp(amount: amount);
    // await fetchWallet();
    return result;
  }

  Future<String?> purchasePlan(
      {required int plan_id, required int discount_id}) async {
    final result = await AuthProvider.value
        .purchasePlan(plan_id: plan_id, discount_id: discount_id);
    await fetchUser();
    return result;
  }

  Future<void> logOut() async {
    await AppSharedPrefs.instance.clear();
    user.value = User.zero();
    Get.offAllNamed(Routes.login);
  }

  // Future<String?> verifyEmail(String otp, String email) {
  //   return AuthProvider.value.verifyEmail(otp: otp, email: email).then(
  //     (value) async {
  //       await login(user.value.email!, user.value.password);

  //       return value;
  //     },
  //   );
  // }

  // Future<String?> sendMailOtp() =>
  //     AuthProvider.value.sendMailOtp(user.value.email!);

  // Future<String?> updateRestaurantDetails({
  //   required String name,
  //   required Address address,
  //   required String avatar,
  //   required String restuarant,
  //   required String coverPhoto,
  //   required String description,
  //   required String openingTime,
  //   required String closingTime,
  // }) {
  //   return AuthProvider.value
  //       .updateRestaurantDetails(
  //           name: name,
  //           address: address,
  //           avatar: avatar,
  //           restuarant: restuarant,
  //           coverPhoto: coverPhoto,
  //           description: description,
  //           openingTime: openingTime,
  //           closingTime: closingTime)
  //       .then((response) {
  //     // TODO: Refetch user if nessecary
  //     //user.value = User.fromJson(response.data!);
  //     return response.message;
  //   });
  // }

  // New upload restaurant profile (working)
/*   Future<String?> updateDetails(
      {required Address address,
      required String restuarantName,
      required String coverPhoto,
      required String description,
      String? regNum,
      required OperatingHours operatingHours,
      String? vendorId}) async {
    // Upload Image
    coverPhoto = await uploadImage(coverPhoto) ?? '';

    return AuthProvider.value
        .updateDetails(
            address: address,
            restuarantName: restuarantName,
            coverPhoto: coverPhoto,
            description: description,
            regNum: regNum,
            operatingHours: operatingHours,
            vendorId: vendorId)
        .then((response) {
      // TODO: Refetch user if nessecary
      //user.value = User.fromJson(response.data!);
      return response.message;
    });
  } */
}
