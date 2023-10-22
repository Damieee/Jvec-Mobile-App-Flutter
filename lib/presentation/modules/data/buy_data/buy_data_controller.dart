import 'package:jvec_app/data/plan/plan.dart';
import 'package:jvec_app/domain/repositories/app_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jvec_app/core/extentions.dart';

import '../../../../core/app_routes.dart';
import '../../../../data/user/user.dart';
import '../../../../domain/repositories/auth_repo.dart';

class BuyDataController extends GetxController {
  final formKey = GlobalKey<FormState>();

  Rx<User> get user => AuthRepository.instance.user;

  final user_plan = Rxn<Plan>();
  final plans = Rxn<Plans>();
  final plan_categories = Rxn<PlanCategories>();

  @override
  void onInit() {
    fetchData();
    super.onInit();
    // wallet_id = Get.arguments;
  }

  Future fetchData() async {
    await Future.wait([
      AppRepository.instance.plans(),
      AppRepository.instance.user_plan()
    ]).then((responses) {
      user_plan.value = responses[1] as Plan?;
      final plans = responses[0] as Plans?;

      plan_categories.value = PlanCategory.sortPlans(plans!);

      // status(RxStatus.success());
    }).catchError((err, stackTrace) {
      plans.value = [];
      if (err is! String) {
        err = err.toString();
      }

      // Error
      showError(err);
    });
  }

  void recievePayment() => Get.toNamed(Routes.receivePayment);
}
