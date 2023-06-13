import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/screens/screen_signup_details.dart';

class OtpController extends GetxController {
  var countryCode = '+92'.obs;
  var phoneController = TextEditingController().obs;
  var pinController = TextEditingController().obs;
  var isOtpSent = false.obs;
  var resendOTP = true.obs;
  var resendAfter = 59.obs;
  var firebaseVerificationId = "";
  var statusMessage = "".obs;
  var statusMessageColor = Colors.black.obs;
  final _auth = FirebaseAuth.instance;

  var timer;

  // AuthController() {}

  @override
  onInit() async {
    super.onInit();
  }

  // getOtp() async {
  //   FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: '+' +
  //         countryCode.toString().trim() +
  //         phoneController.value.text.toString().trim(),
  //     verificationCompleted: (PhoneAuthCredential credential) {},
  //     verificationFailed: (FirebaseAuthException e) {},
  //     codeSent: (String verificationId, int? resendToken) {
  //       firebaseVerificationId = verificationId;
  //       isOtpSent.value = true;
  //       statusMessage.value =
  //           "OTP re-sent to ${countryCode}" + phoneController.value.text;
  //       startResendOtpTimer();
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   );
  // }

  Future<void> getOtp() async {
    String response = '';
    String phone = phoneController.value.text;

    String full_phone = '+' +
        countryCode.toString().trim() +
        phoneController.value.text.toString().trim();
    print(full_phone);

    await _auth.verifyPhoneNumber(
      phoneNumber: (full_phone),
      timeout: Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) {
        _auth.signInWithCredential(credential).then((value) {
          pinController.value.text = credential.smsCode ?? "";
        }).catchError((error) {
          Get.snackbar('Alert', error.toString());
          print(error.toString());
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.snackbar('Alert', e.message.toString());
        print(e.toString());
        Get.back();
      },
      codeSent: (String verificationId, int? resendToken) {
        isOtpSent.value = true;
        firebaseVerificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        isOtpSent.value = true;
        firebaseVerificationId = verificationId;
      },
    );
  }


  Future<void> verifyOTP() async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: firebaseVerificationId, smsCode: pinController.value.text.toString());

    try {
      await _auth.signInWithCredential(phoneAuthCredential).then((value) {
        return Get.to(SignUpDetailsScreen());
      });
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      Get.snackbar('Alert', 'Invalid  OTP');
    }
  }



  // resendOtp() async {
  //   resendOTP.value = false;
  //   FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: '+' +
  //         countryCode.toString().trim() +
  //         phoneController.value.text.toString().trim(),
  //     verificationCompleted: (PhoneAuthCredential credential) {},
  //     verificationFailed: (FirebaseAuthException e) {},
  //     codeSent: (String verificationId, int? resendToken) {
  //       firebaseVerificationId = verificationId;
  //       isOtpSent.value = true;
  //       statusMessage.value =
  //           "OTP re-sent to ${countryCode}" + phoneController.value.text;
  //       startResendOtpTimer();
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   );
  // }

  // verifyOTP() async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   try {
  //     statusMessage.value = "Verifying... " + pinController.value.text;
  //     await auth.setSettings(
  //       forceRecaptchaFlow: true,
  //       appVerificationDisabledForTesting: true,
  //     );
  //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //         verificationId: firebaseVerificationId,
  //         smsCode: pinController.value.text.toString());
  //
  //     await auth.signInWithCredential(credential).then(
  //       (value) {
  //         Get.off(SignUpDetailsScreen());
  //       },
  //     );
  //   } catch (e) {
  //     statusMessage.value = "Invalid  OTP";
  //     statusMessageColor = Colors.red.obs;
  //     Get.snackbar('Alert', 'Invalid  OTP');
  //   }
  // }

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
