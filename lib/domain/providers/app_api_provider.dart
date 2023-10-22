import 'dart:developer';

import 'package:jvec_app/data/plan/plan.dart';
import 'package:jvec_app/domain/providers/response/responses.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../../data/wallet/wallet.dart';
import '../../main.dart';
import '../../presentation/utils/strings.dart';
import '../repositories/auth_repo.dart';

final printResponses = true;

class AppProvider extends GetConnect {
  static AppProvider get value => Get.find<AppProvider>();

  // get _userType => AuthRepository.instance.user.value.type.name;

  get _id => AuthRepository.instance.user.value.id;

  @override
  void onInit() {
    httpClient.baseUrl = AppStrings.baseUrl;

    httpClient.defaultDecoder = (val) {
      if (val is String) {
        if (val.contains('Internal Server Error'))
          val = "Oops, An error occured. Please try that again";
        return ApiResponse(true, status: false, message: val);
      }
      return ApiResponse.fromJson(val);
    };
    httpClient.errorSafety = true;

    // Http and websockets if used with no [httpClient] instance

    // It's will attach 'apikey' property on header from all requests

    httpClient.addRequestModifier((Request request) {
      if (AuthRepository.instance.user.value.token != null) {
        request.headers['Authorization'] =
            'Bearer ${AuthRepository.instance.user.value.token!.access_token}';
      }
      return request;
    });

    /* // Even if the server sends data from the country "Brazil",
    // it will never be displayed to users, because you remove
    // that data from the response, even before the response is delivered
    // if(AuthRepository.instance.user.value.vendorProfile != null||AuthRepository.instance.user.value.customerProfile != null)
    httpClient.addAuthenticator((Request request) async {
      var resp;
      var response;
      var token;
      var refreshToken;

      var body = {
        "refreshToken": AuthRepository.instance.user.value.refreshToken
      };

      //  try {
      resp = await post<ApiResponse>('/$_userType/refresh-token', body);
      response = getErrorMessage(resp);
      if (response != null) {
        AuthRepository.instance.user.value = User();
        Get.offAllNamed(Routes.customerTypeScreen);
        Get.showSnackbar(GetSnackBar(
          message: response,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ));
        await Future.delayed(Duration(milliseconds: 3100));
        Get.closeAllSnackbars();
      } else {
        token = resp.body.data['token'];
        refreshToken = resp.body.data['refreshToken'];

        AuthRepository.instance.user.value = AuthRepository.instance.user.value
            .copyWith(refreshToken: refreshToken, token: token);

        request.headers['Authorization'] = 'Bearer $token';
      }
      return request;
      //}  catch (e) {

      // return request;

      // }
    }); */

    //Autenticator will be called 3 times if HttpStatus is
    //HttpStatus.unauthorized
    httpClient.maxAuthRetries = 1;
    httpClient.timeout = Duration(seconds: 30);

    // Does Rubish
    // httpClient.addResponseModifier<ApiResponse>(
    //   (request, response) {
    //     print(request.decoder.toString());
    //     print(response.bodyString);

    //     return response.body;
    //   },
    // );
    appDebugMode.listen((_) => httpClient.baseUrl = AppStrings.baseUrl);
  }

  Future<String?> claim_free_data({
    required String email,
  }) {
    return post<ApiResponse>('/plans/claim-data', {}, query: {
      'email': email,
    }).then(
      (value) {
        var response;

        //Check for error
        response = getErrorMessage(value);
        if (response != null) {
          throw (response);
        } else {
          /*           {
            "status": true,
            "message": "20MB RECHARGE data claimed successfully! Best of luck.",
            "data": null
          } */
          /*
          {
            "status": true,
            "message": "You have exahusted your ability to get free data, please use your data to fund your wallet",
            "data": null
          }
           */
          response = value.body?.message;

          // if (response?.contains("exahusted")) {
          //   // print('throw');
          //   throw (response);
          // }
        }

        return response;
      },
    );
  }

  Future<String> chargeCard(
    String authorization_code,
    String amount,
    String email,
  ) {
    return post<ApiResponse>('/wallet/charge-card', {
      'authorization_code': authorization_code,
      'amount': amount,
      'email': email
    }).then(
      (value) {
        var response;

        //Check for error
        response = getErrorMessage(value);
        if (response != null) {
          throw (response);
        } else {
          response = value.body?.message;
        }

        return response;
      },
    );
  }

  Future<DebitCards> cards() {
    return get<ApiResponse>('/wallet/cards').then(
      (value) {
        var response;

        //Check for error
        response = getErrorMessage(value);
        if (response != null) {
          throw (response);
        } else {
          response = (value.body!.data as List<dynamic>)
              .map((e) => DebitCard.fromJson(e as Map<String, dynamic>))
              .toList();
        }

        return response;
      },
    );
  }

  Future<String> delete_cards(int id) {
    return delete<ApiResponse>('/wallet/cards/$id').then(
      (value) {
        var response;

        //Check for error
        response = getErrorMessage(value);
        if (response != null) {
          throw (response);
        } else {
          response = value.body!.message;
        }

        return response;
      },
    );
  }

  Future<Plans> plans() {
    return get<ApiResponse>('/plans/available-plans').then(
      (value) {
        var response;

        //Check for error
        response = getErrorMessage(value);
        if (response != null) {
          throw (response);
        } else {
          response = (value.body!.data as List<dynamic>)
              .map((e) => Plan.fromJson(e as Map<String, dynamic>))
              .toList();
        }

        return response;
      },
    );
  }

  Future<Plan> user_plan() {
    return get<ApiResponse>('/plans/user-plan').then(
      (value) {
        var response;

        //Check for error
        response = getErrorMessage(value);
        if (response != null) {
          throw (response);
        } else {
          response = Plan.fromJson(value.body?.data);
        }

        return response;
      },
    );
  }

  Future<FundwalletResponse> topUp({
    required num amount,
    required String? type,
  }) {
    return post<ApiResponse>('/wallet/fund', {
      "amount": amount,
      "type": type,
    }).then(
      (value) {
        var response;

        //Check for error
        response = getErrorMessage(value);
        if (response != null) {
          throw (response);
        } else {
          response = FundwalletResponse.fromJson(value.body?.data);
        }

        return response;
      },
    );
  }

  Future<VerificationResponse> verify_payment({
    required String reference,
  }) {
    return post<ApiResponse>('/wallet/verify_transaction', {}, query: {
      'reference': reference,
    }).then(
      (value) {
        var response;

        //Check for error
        response = getErrorMessage(value);
        if (response != null) {
          throw (response);
        } else {
          response = VerificationResponse.fromJson(value.body?.data);
        }

        return response;
      },
    );
  }
}

String? getErrorMessage(Response<ApiResponse> response) {
  if (kDebugMode && printResponses) {
    log(' Status Code: ${response.statusCode}');
    log(' Status Text: ${response.statusText}');
    log(' Response Body: ${response.bodyString}');
    log('Headers: ${response.request?.headers.toString()}');
    log(' URL: ${response.request?.url}');
  }

  if (response.statusCode != null &&
      response.isOk &&
      (response.body!.status == true || response.body!.error == false)) {
    print('Response is okay: ${response.isOk}');
    return null;
  } else if (response.body == null) {
    // Send Error Locally
    return "Error: Couldn't connect to the internet, check your connection";
  } else if (response.body!.message != null) {
    return response.body!.message;
  } else {
    return 'Something went wrong, please try again later';
  }
}
