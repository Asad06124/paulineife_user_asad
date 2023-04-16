import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:paulineife_user/controller/login_controller.dart';
import 'package:paulineife_user/controller/otp_controller.dart';
import 'package:paulineife_user/views/screens/screen_home.dart';

class RegistrationController extends GetxController {
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  var usernameController = TextEditingController().obs;
  var firstNameController = TextEditingController().obs;
  var lastNameController = TextEditingController().obs;
  var confirmPasswordController = TextEditingController().obs;
  var otpController = Get.put(OtpController());
  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxString dobController = ''.obs;

  Future<void> selectDate(BuildContext context) async {
    var lastDate = DateTime.now().copyWith(year: DateTime.now().year - 18);

    final DateTime? picked = await showDatePicker(context: context, initialDate: lastDate, firstDate: DateTime(1950), lastDate: lastDate);
    if (picked != null && picked != selectedDate) {
      selectedDate.value = picked;
      dobController.value = DateFormat('dd/MM/yyyy').format(selectedDate.value);
      update();
    }
  }

  void handleSignUp() async {
    final String phone = otpController.countryCode.toString().trim() + phoneController.value.text.toString().trim();

    final response = await http.post(Uri.parse('https://rollupp.co/api/checkuser/'), body: {
      'user': phone,
    });

    if (response.statusCode == 200) {
      Map jsonResponse = json.decode(response.body);
      if (jsonResponse.containsKey('User_id')) {
        Get.snackbar('Alert', 'Phone number already exists',
            backgroundColor: Colors.transparent, overlayColor: Colors.red.withOpacity(0.2), overlayBlur: 0.2);
      }
      log(jsonResponse.toString());
    } else {
      Map jsonResponse = json.decode(response.body);

      if (jsonResponse.containsKey('msg')) {
        // log(response.body.toString());
        log(phone);
        log('${response.statusCode}');
        log('${response.body}');
        otpController.getOtp();
        otpController.startResendOtpTimer();
        otpController.isOtpSent.value = true;
        otpController.update();
      }
      // log(response.body);
    }
  }

  Future<void> signUp() async {
    final String phone = otpController.countryCode.toString().trim() + phoneController.value.text.toString().trim();
    final String emilController = emailController.value.text.toString().trim();
    final String usrnameController = usernameController.value.text.toString().trim();
    final String frstNameController = firstNameController.value.text.toString().trim();
    final String dbController = dobController.value.toString().trim();
    final String pwdController = passwordController.value.text.toString().trim();

    final response = await http.post(Uri.parse('https://rollupp.co/api/register/'), body: {
      "email": emilController,
      "username": usrnameController,
      "firstname": frstNameController,
      "dob": dbController,
      "phone": phone,
      "password": pwdController,
    });
    if (response.statusCode == 200) {
      Map jsonResponse = json.decode(response.body);
      print(jsonResponse);
      // Get.to(HomeScreen());
      Get.snackbar(
        "Success",
        "Registration Successful",
        colorText: Colors.white,
        backgroundColor: Colors.green,
      );
      await LoginController.login(phone, pwdController);
    } else {
      Map jsonResponse = json.decode(response.body);
      if (jsonResponse.containsKey('errors')) {
        Get.snackbar('Alert', ' Email/Username already exist',
            backgroundColor: Colors.transparent, overlayColor: Colors.red.withOpacity(0.2), overlayBlur: 0.2);
      }
      print(jsonResponse);
    }
  }
}
