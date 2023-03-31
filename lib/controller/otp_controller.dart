import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/screens/screen_signup_details.dart';

class OtpController extends GetxController {
  RxBool isChecked = false.obs;
  File? img;
  List<File> images = [];
  File? StoryImg;
  File? vid;
  RxBool liked = true.obs;
  var countryCode = ''.obs;
  var phoneController = TextEditingController().obs;
  var pinController = TextEditingController().obs;
  var isOtpSent = false.obs;
  var resendOTP = true.obs;
  var resendAfter = 59.obs;
  var firebaseVerificationId = "";
  var statusMessage = "".obs;
  var statusMessageColor = Colors.black.obs;

  var timer;

  // AuthController() {}

  @override
  onInit() async {
    super.onInit();
  }

  getOtp() async {
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+' +
          countryCode.toString().trim() +
          phoneController.value.text.toString().trim(),
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        firebaseVerificationId = verificationId;
        isOtpSent.value = true;
        statusMessage.value =
            "OTP re-sent to ${countryCode}" + phoneController.value.text;
        startResendOtpTimer();
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  resendOtp() async {
    resendOTP.value = false;
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+' +
          countryCode.toString().trim() +
          phoneController.value.text.toString().trim(),
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        firebaseVerificationId = verificationId;
        isOtpSent.value = true;
        statusMessage.value =
            "OTP re-sent to ${countryCode}" + phoneController.value.text;
        startResendOtpTimer();
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  verifyOTP() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      statusMessage.value = "Verifying... " + pinController.value.text;
      await auth.setSettings(
          forceRecaptchaFlow: true, appVerificationDisabledForTesting: true,);
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: firebaseVerificationId,
          smsCode: pinController.value.text.toString() );

      await auth.signInWithCredential(credential).then(
        (value) {
          Get.off(SignUpDetailsScreen());
        },
      );
    } catch (e) {
      statusMessage.value = "Invalid  OTP";
      statusMessageColor = Colors.red.obs;
      Get.snackbar('Alert', 'Invalid  OTP');
    }
  }

  startResendOtpTimer() async {
    resendOTP.value = false;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (resendAfter.value > 1) {
        resendAfter.value--;
      } else if (resendAfter.value <= 1) {
        resendAfter.value = 59;
        timer.cancel();
        resendOTP.value = true;
      } else {
        resendAfter.value = 59;
        resendOTP.value = true;
        timer.cancel();
      }
      update();
    });
    update();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
