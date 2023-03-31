import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:paulineife_user/controller/otp_controller.dart';

import '../views/screens/screen_terms_conditions.dart';

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
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate.value = picked;
      dobController.value = DateFormat('dd/MM/yyyy').format(selectedDate.value);
      update();
    }
  }

  void handleSignUp() async {
    final String phone = otpController.countryCode.toString().trim() + phoneController.value.text.toString().trim();

    final response =
        await http.post(Uri.parse('https://rollupp.co/api/checkuser/'), body: {
      'user': phone,
    });

    if (response.statusCode == 200) {
      Map jsonResponse = json.decode(response.body);
      if (jsonResponse.containsKey('User_id')) {
        Get.snackbar('Alert', 'Phone number already exists',
            backgroundColor: Colors.transparent,
            overlayColor: Colors.red.withOpacity(0.2),
            overlayBlur: 0.2);
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

    final response =
        await http.post(Uri.parse('https://rollupp.co/api/register/'), body: {
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
      Get.to(TermsConditionsScreen());
    }
    else{
      Map jsonResponse = json.decode(response.body);
     if (jsonResponse.containsKey('errors')) {
       Get.snackbar('Alert', ' Email/Username already exist',
           backgroundColor: Colors.transparent,
           overlayColor: Colors.red.withOpacity(0.2),
           overlayBlur: 0.2);
     }
      print(jsonResponse);
    }
  }
}
