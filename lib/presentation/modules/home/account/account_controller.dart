import 'package:jvec_app/core/extentions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/user/user.dart';
import '../../../../domain/repositories/auth_repo.dart';
import '../../../widgets/log_out_dialog.dart';

class AccountPageController extends GetxController {
  Rx<User> get user => AuthRepository.instance.user;
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  void onReady() {
    refresh();
    super.onReady();
  }

  Future<void> refresh() => _fetchData();

  void logout() {
    Get.dialog(
      LogOutDialog(
        onContinuationPressed: () async {
          AuthRepository.instance.logOut();
        },
      ),
    );
  }

  String get initials {
    String? first_name = user.value.name;
    return first_name == null ? "" : first_name[0];
  }

  Future _fetchData() {
    refreshIndicatorKey.currentState?.show();

    return AuthRepository.instance.fetchUser().then((wallet) {
      // Success
    }).catchError((err, stackTrace) {
      if (err is! String) {
        err = err.toString();
      }
      // Error
      showError(err);
    });
  }
}
