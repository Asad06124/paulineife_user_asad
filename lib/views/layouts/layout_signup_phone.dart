import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:ola_like_country_picker/ola_like_country_picker.dart';
import 'package:paulineife_user/controller/otp_controller.dart';
import 'package:paulineife_user/views/screens/screen_signup_details.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

import '../../helpers/theme_service.dart';
import '../../widgets/custom_buttom.dart';

class SignUpPhoneScreen extends StatefulWidget {
  SignUpPhoneScreen({Key? key}) : super(key: key);

  @override
  State<SignUpPhoneScreen> createState() => _SignUpPhoneScreenState();
}

class _SignUpPhoneScreenState extends State<SignUpPhoneScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  var controller = Get.put(OtpController());
  // late CountryPicker c;
  // Country country = Country.fromJson(countryCodes[94]);

  final focusNode = FocusNode();
  var first = true;

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // c = CountryPicker(onCountrySelected: (Country country) {
    //   print(country);
    //   setState(() {
    //     this.country = country;
    //     controller.countryCode.value = country.dialCode;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    var WHeight = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            ThemeService.isSavedDarkMode() ? Colors.black : Color(0xfff9f9f9),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Obx(() {
            return Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      // GestureDetector(
                      //   child: Container(
                      //     height: Get.height / 12,
                      //     width: 60.sp,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10.sp),
                      //       border: Border.all(
                      //         color: Color(0xffD6D9E3),
                      //       ),
                      //       color: ThemeService.isSavedDarkMode()
                      //           ? Colors.black
                      //           : Color(0xffFFFFFF),
                      //     ),
                      //     child: Column(
                      //       children: [
                      //         Row(
                      //           crossAxisAlignment: CrossAxisAlignment.center,
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             Text(
                      //               '${country.code} ',
                      //               textAlign: TextAlign.center,
                      //               style: TextStyle(
                      //                   fontSize: 15.sp,
                      //                   fontWeight: FontWeight.w500,
                      //                   color: Color(0xff79869F)),
                      //             ),
                      //             Icon(
                      //               Icons.keyboard_arrow_down_outlined,
                      //               color: ThemeService.isSavedDarkMode()
                      //                   ? Color(0xff79869F)
                      //                   : Color(0xff79869F),
                      //             )
                      //           ],
                      //         ),
                      //         SizedBox(
                      //           height: 1.sp,
                      //         ),
                      //         Text(
                      //           '${country.dialCode}',
                      //           style: TextStyle(
                      //             fontSize: 16.sp,
                      //             fontWeight: FontWeight.w400,
                      //             color: ThemeService.isSavedDarkMode()
                      //                 ? Colors.white
                      //                 : Colors.black,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      //   onTap: () {
                      //     controller.isOtpSent.value ? null : c.launch(context);
                      //     // setState(() {
                      //     // controller.countryCode.value = country.dialCode;
                      //     //  });
                      //   },
                      // ),
                      Form(
                        key: formKey,
                        child: Container(
                          margin: EdgeInsets.only(left: 5.sp),
                          padding: EdgeInsets.only(top: 12.sp),
                          height: Get.height / 12,
                          width: Get.width / 1.6,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xffD6D9E3),
                              ),
                              color: ThemeService.isSavedDarkMode()
                                  ? Colors.black
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: controller.phoneController.value,
                            keyboardType: TextInputType.phone,
                            readOnly: controller.isOtpSent.value,
                            style: TextStyle(
                              color: ThemeService.isSavedDarkMode()
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            validator: (value) {
                              if (value!.isPhoneNumber) {
                                return null;
                              } else {
                                return 'Enter valid Phone Number';
                              }
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: ThemeService.isSavedDarkMode()
                                  ? Colors.black
                                  : Colors.white,
                              label: Text(
                                'Phone Number',
                                style: TextStyle(
                                  color: ThemeService.isSavedDarkMode()
                                      ? Color(0xff79869F)
                                      : Color(0xff79869F),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                controller.resendOTP.value == true
                    ? CustomButton1(
                        text: controller.isOtpSent.value
                            ? 'Resend Code'
                            : 'Send Code',
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ThemeService.isSavedDarkMode()
                              ? Colors.white
                              : Colors.white,
                        ),
                        elevation: 0,
                        height: 45.sp,
                        width: 115.sp,
                        color: Color(0xff2A70C8),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            controller.getOtp();
                            controller.startResendOtpTimer();
                            controller.isOtpSent.value = true;
                          }
                        },
                      )
                    : Padding(
                        padding: EdgeInsets.only(top: 20.sp),
                        child: Center(
                          child: Text(
                            'Wait ${controller.resendAfter} second',
                            style: TextStyle(
                                color: ThemeService.isSavedDarkMode()
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Verify Code',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ThemeService.isSavedDarkMode()
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                // Directionality(
                //   // Specify direction if desired
                //   textDirection: TextDirection.ltr,
                //   child: ,
                // ),
                SizedBox(
                  height: 10.sp,
                ),
                Form(
                  key: formKey1,
                  child: Container(
                    height: 70.sp,
                    width: Get.width * .8,
                    // padding: EdgeInsets.symmetric(vertical: 10.sp,horizontal: 20.sp),
                    child: Pinput(
                      scrollPadding: EdgeInsets.all(10.sp),
                      controller: controller.pinController.value,
                      focusNode: focusNode,
                      androidSmsAutofillMethod:
                          AndroidSmsAutofillMethod.smsUserConsentApi,
                      listenForMultipleSmsOnAndroid: true,
                      length: 6,
                      preFilledWidget: Text(
                        '2',
                        style: TextStyle(
                          color: ThemeService.isSavedDarkMode()
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      validator: (value) {
                        return value!.isNotEmpty ? null : 'Pin is required';
                      },
                      // onClipboardFound: (value) {
                      //   debugPrint('onClipboardFound: $value');
                      //   pinController.setText(value);
                      // },
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      onCompleted: (pin) {
                        debugPrint('onCompleted: $pin');
                      },
                      onChanged: (value) {
                        controller.pinController.value.text = value;
                      },
                      // cursor: Container(
                      //   margin: const EdgeInsets.only(bottom: 9),
                      //   width: 22,
                      //   height: 1,
                      // ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                CustomButton1(
                    text: 'Next',
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ThemeService.isSavedDarkMode()
                          ? Colors.white
                          : Colors.white,
                    ),
                    elevation: 0,
                    height: 45.sp,
                    width: 115.sp,
                    color: Color(0xff2A70C8),
                    onPressed: () {
                      if (formKey1.currentState!.validate()) {
                        controller.verifyOTP();
                      }
                    }),
              ],
            );
          }),
        ),
      ),
    );
  }
}
