import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jvec_app/core/extentions.dart';
import 'package:jvec_app/core/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  final formKey = GlobalKey<FormState>(); //for the form

//Declare key variable in editing User Profile
  String username = 'Joseph';
  String email = 'olaifaolawale43@yahoo.com';
  int phonenumber = 08145800491;

//creating the text-editing-controller for User-Profile.
  TextEditingController userText = TextEditingController();
  TextEditingController emailText = TextEditingController();
  TextEditingController phoneText = TextEditingController();

  //create a function to save the user input
  void saveUserProfile() {
    // Update the variables with the new values from the text controllers.
    username = userText.text;
    email = emailText.text;
    phonenumber = int.tryParse(phoneText.text) ?? phonenumber;
  }

  // create a function to submit the user input.
  void submitUserProfile() => Get.toNamed(Routes.home);

  //create a function to save the data locally
  Future<void> saveDataToSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user', username);
    prefs.setString('email', email);
    prefs.setInt('phonenumber', phonenumber);
  }
}
