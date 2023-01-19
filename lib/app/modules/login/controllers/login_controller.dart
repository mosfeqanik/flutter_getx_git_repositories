import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/services/cache_manager.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController with CacheManager {
  //TODO: Implement LoginController
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isSignUpButtonClick = false.obs;

  String? loggedInEmail;

  //login and token check
  loginFunc() async {
    if (emailController.text.isEmpty && emailController.text.isEmpty) {
      Get.snackbar(
          backgroundColor: Colors.red,
          "oops",
          "input data is missing",
          colorText: Colors.white);
    } else {
      try {
        if (emailController.text == "anik@gmail.com" &&
            passwordController.text == "12345") {
          Get.snackbar(
              backgroundColor: Colors.green,
              "Hello",
              "Welcome",
              colorText: Colors.white);
          savetoken(token: "token from api");
          Get.offNamed(Routes.HOME);
        } else {
          Get.snackbar(
              backgroundColor: Colors.red,
              "OOPs",
              "something is wrong",
              colorText: Colors.white);
        }
      } catch (e) {
        print("anik--> $e");
      }
    }
  }

  registerFunc() async {
    if (emailController.text.isEmpty && emailController.text.isEmpty) {
      Get.snackbar(
          backgroundColor: Colors.red,
          "oops",
          "input data is missing",
          colorText: Colors.white);
    } else {
      try {
        if (emailController.text == "anik@gmail.com" &&
            emailController.text == "12345") {
          Get.snackbar(
              backgroundColor: Colors.green,
              "Hello",
              "Welcome new user",
              colorText: Colors.white);
          savetoken(token: "token from api");
          Get.offNamed(Routes.HOME);
        } else {
          Get.snackbar(
              backgroundColor: Colors.red,
              "OOPs",
              "something is wrong",
              colorText: Colors.white);
        }
      } catch (e) {
        print("anik--> $e");
      }
    }
  }
}
