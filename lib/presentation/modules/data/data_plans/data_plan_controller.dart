import 'package:jvec_app/data/plan/plan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes.dart';
import '../../../../data/user/user.dart';
import '../../../../domain/repositories/auth_repo.dart';

class DataPlanController extends GetxController {
  final formKey = GlobalKey<FormState>();

  Rx<User> get user => AuthRepository.instance.user;

  final plan_category = Rxn<PlanCategory>();

  @override
  void onInit() {
    super.onInit();
    plan_category.value = Get.arguments;
  }

  void recievePayment() => Get.toNamed(Routes.receivePayment);
}
