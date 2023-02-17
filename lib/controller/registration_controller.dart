import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/views/screens/screen_login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helpers/helpers.dart';
import '../helpers/firebase_utils.dart';
import '../models/user.dart';

class RegistrationController extends GetxController {
  RxBool visible = true.obs;
  RxString Gender = 'Male'.obs;
  Color primary = const Color(0xffeef444c);
  File? img;
  RxString profileImageURL = ''.obs;
  RxString notifications = ''.obs;
  List<String> screenShots = [];
  RxBool laoding = false.obs;
  List<String> ScreenShotsUrl = [];
  RxInt timeStamp = DateTime.now().millisecondsSinceEpoch.obs;
  final fiverrController = TextEditingController().obs;
  final upworkController = TextEditingController().obs;
  final freelanceController = TextEditingController().obs;
  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;
  final buyerIdController = TextEditingController().obs;
  final complaintController = TextEditingController().obs;

  void signUp(String Fiverr, String Freelance, String Upwork) async {
    String email = emailController.value.text.trim();
    String password = passwordController.value.text.trim();
    String confirmPassword = confirmPasswordController.value.text.trim();
    String name = nameController.value.text.trim();
    String address = addressController.value.text.trim();
    String fiverrID = fiverrController.value.text.trim();
    String upworkID = upworkController.value.text.trim();
    String freelanceID = freelanceController.value.text.trim();
    String gander = Gender.value;

    if (email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        name.isEmpty ||
        password != confirmPassword) {
      Get.snackbar("Alert", "Error");
    } else if (email.isNotEmpty) {
      bool isValidEmail = EmailValidator.validate(email);
      if (isValidEmail) {

        try {
          laoding.value = true;
          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password)
              .then((value) {
            value.user!.sendEmailVerification();
            print("signUp");
            Get.offAll(ScreenLogin());
            var id = value.user!.uid;
            Users user = Users(
              id: id,
              name: name,
              email: email,
              password: password,
              confirmPassword: confirmPassword,
              gender: gander,
              notification: notifications.value,
              profileImageURL: profileImageURL.value,
              address: address,
              fiverID: Fiverr,
              upworkID: Upwork,
              freelanceID: Freelance,
              timeStamp: DateTime.now().millisecondsSinceEpoch,
              approved: false,
              declined: false,
              blocked: false, postNotifi: false, UpdateNotifi: false,
            );
            FirebaseFirestore.instance
                .collection("users")
                .doc(user.id)
                .set(user.toMap())
                .then((value) {
              // Get.snackbar("Alert", "User Register");
            });
            // FirebaseFirestore.instance.collection("users").doc(user.id).collection("collectionPath").doc().collection(collectionPath)
            // if (value.user!.emailVerified) {
            //   // Get.snackbar("Alert", "Verified");
            //   Get.offAll(ScreenHomePage());
            //
            // }
            // else{
            //   Get.snackbar("Alert", "First verify your email");
            // }
          });
        } on FirebaseAuthException catch (e) {
          laoding.value = false;
          switch (e.code) {
            case 'invalid-email':
              Get.snackbar('Alert', 'invalid email',
                  backgroundColor: Colors.transparent,
                  colorText: Colors.white,
                  overlayBlur: 2.0,
                  overlayColor: Colors.red.withOpacity(0.3));
              break;
            case 'email-already-in-use':
              Get.snackbar('Alert', 'email is already in use',
                  backgroundColor: Colors.transparent,
                  colorText: Colors.white,
                  overlayBlur: 2.0,
                  overlayColor: Colors.red.withOpacity(0.3));
              break;
            default:
          }
        }
      }
    } else {
      print("Error");
      Get.snackbar("Alert Message", "Please enter an email ",
          backgroundColor: Colors.transparent,
          colorText: Colors.white,
          overlayBlur: 2.0,
          overlayColor: Colors.red.withOpacity(0.3));
    }
  }

  void login() async {
    String email = emailController.value.text.trim();
    String password = passwordController.value.text.trim();
    if (email.isNotEmpty) {
      bool isValidEmail = EmailValidator.validate(email);
      if (isValidEmail) {
        try {
          laoding.value = true;
          await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password)
              .then(
            (value) async {
              print("LogIn");
              if (value.user!.emailVerified) {
                Get.offAll(ScreenLogin());
                SharedPreferences.getInstance().then(
                      (prefs) {
                    prefs.setString('email', email);
                    // prefs.setString('password', password);
                  },
                );
              } else {
                laoding.value = false;
                Get.snackbar('Please first verify your email', '',
                    backgroundColor: Colors.transparent,
                    colorText: Colors.white,
                    overlayBlur: 2.0,
                    overlayColor: Colors.red.withOpacity(0.3));
              }
            },
          );
        } on FirebaseAuthException catch (e) {
          laoding.value = false;
          switch (e.code) {
            case 'user-not-found':
              Get.snackbar('Email not registered', '',
                  backgroundColor: Colors.transparent,
                  colorText: Colors.black,
                  overlayBlur: 2.0,
                  overlayColor: Colors.red.withOpacity(0.2));
              break;
            case 'wrong-password':
              Get.snackbar('Wrong Password', '',
                  backgroundColor: Colors.transparent,
                  colorText: Colors.black,
                  overlayBlur: 2.0,
                  overlayColor: Colors.red.withOpacity(0.2));
              break;
            default:
          }
        }
      } else {
        Get.snackbar('Please check your email and password', '',
            backgroundColor: Colors.transparent,
            colorText: Colors.white,
            overlayBlur: 2.0,
            overlayColor: Colors.red.withOpacity(0.3));
      }
    }
  }

  void forgotPassword() async {
    String email = emailController.value.text.trim();
    print(email);
    if (email.isNotEmpty) {
      bool isValidEmail = EmailValidator.validate(email);
      if (isValidEmail) {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: email)
            .then((value) async {
          Get.snackbar("Email has been sent", "",
              backgroundColor: Colors.transparent,
              colorText: Colors.white,
              overlayBlur: 2.0,
              overlayColor: Colors.red.withOpacity(0.3));
          await Future.delayed(Duration(seconds: 2))
              .then((value) => Get.to(ScreenLogin()));
        });
      } else {
        Get.snackbar("Please Check your email or password", "",
            backgroundColor: Colors.transparent,
            colorText: Colors.white,
            overlayBlur: 2.0,
            overlayColor: Colors.red.withOpacity(0.3));
      }
    } else {
      print("Error");
      Get.snackbar("Please enter an email ", '',
          backgroundColor: Colors.transparent,
          colorText: Colors.white,
          overlayBlur: 2.0,
          overlayColor: Colors.red.withOpacity(0.3));
    }
  }



  Future<void> editProfile() async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('ProfilePics/' + uid + '/${uid}.jpg');
    await ref.putFile(File(img!.path));
    String profilePicLink = '';

    ref.getDownloadURL().then((value) async {
      profilePicLink = value;
      userRef.doc(uid).update({'profileImageURL': profilePicLink});
    });
    String name = nameController.value.text.trim();
    String address = addressController.value.text.trim();
    if (nameController != null && addressController != null) {
      userRef.doc(uid).update({
        'name': name,
        'address': address,
      });
    }
  }

  // Future<void> UploadComplaint(
  //     bool isFreelancePost, bool isFiverrPost, bool isUpworkPost,String buyerId) async {
  //   var id = DateTime.now().millisecondsSinceEpoch;
  //   String description = complaintController.value.text.trim();
  //
  //   // await FirebaseUtils.uploadMultipleImage(controller.imageList, "services/${id}/servicesImages", extension:"png,jpg,jpeg",
  //   var images = await FirebaseUtils.uploadMultipleFiles(
  //       screenShots, "post/${uid}/${id}/",
  //       extension: "png,jpg,jpeg");
  //   // Posts post = Posts(
  //   //     description: description,
  //   //     uid: uid,
  //   //     postImages: images,
  //   //     timeStamp: id,
  //   //     isFreelancePost: isFreelancePost,
  //   //     isFiverrPost: isFiverrPost,
  //   //     isUpworkPost: isUpworkPost,
  //   //     buyerID: buyerId);
  //   // postsRef.doc(id.toString()).set(post.toMap()).then((value) {
  //   //   complaintController.value.clear();
  //   //   buyerIdController.value.clear();
  //   //   screenShots.clear();
  //   //   timeStamp.close();
  //   //
  //   //   // timeStamp.update((val) { })
  //   // });
  //   Get.back();
  // }

// Future<String?> passwordvalidate(String value) async {
//   if (passwordController !=
//       confirmPasswordController) {
//     return "Password don't match";
//   }
// }
}
