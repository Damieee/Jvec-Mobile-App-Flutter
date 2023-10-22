import 'package:jvec_app/domain/repositories/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnsureAuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return AuthRepository.instance.isAuthenticated || route == '/login'
        ? null
        : RouteSettings(name: '/login');
  }
}

class EnsureNotAuthedMiddleware extends GetMiddleware {
  // @override
  // Future<RouteDecoder?> redirectDelegate(RouteDecoder route) async {
  //   if (AuthService.to.isLoggedInValue) {
  //     //NEVER navigate to auth screen, when user is already authed
  //     return null;

  //     //OR redirect user to another screen
  //     //return RouteDecoder.fromRoute(Routes.PROFILE);
  //   }
  //   return await super.redirectDelegate(route);
  // }

  @override
  RouteSettings? redirect(String? route) {
    return AuthRepository.instance.isAuthenticated
        ? RouteSettings(name: '/home')
        : null;
  }
}
