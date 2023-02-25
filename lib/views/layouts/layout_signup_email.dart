import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ola_like_country_picker/ola_like_country_picker.dart';
import 'package:paulineife_user/views/screens/screen_signup_details.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/custom_buttom.dart';

class SignUpEmailScreen extends StatefulWidget {
  SignUpEmailScreen({Key? key}) : super(key: key);

  @override
  State<SignUpEmailScreen> createState() => _SignUpEmailScreenState();
}

class _SignUpEmailScreenState extends State<SignUpEmailScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  late CountryPicker c;
  Country country = Country.fromJson(countryCodes[94]);
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    c = CountryPicker(onCountrySelected: (Country country) {
      print(country);
      setState(() {
        this.country = country;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var WHeight = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.only(top: 12.sp),
                height: Get.height / 12,
                width: Get.width / 1.1,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffD6D9E3),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: TextEditingController(text: 'example@gmail.com'),
                  decoration: InputDecoration(
                    label: Text('Email'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            CustomButton1(
                text: 'Send Code',
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'DMSansR',
                  color: Colors.white,
                ),
                elevation: 0,
                height: Get.height / 16,
                width: Get.width / 2.3,
                color: Color(0xff2A70C8),
                onPressed: () {}),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Verify Code',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'DMSansR',
                  color: Colors.black),
            ),
            // Directionality(
            //   // Specify direction if desired
            //   textDirection: TextDirection.ltr,
            //   child: ,
            // ),
            SizedBox(height: 10.sp,),
            Align(
              alignment: Alignment.center,
              child: Pinput(
                controller: pinController,
                focusNode: focusNode,
                androidSmsAutofillMethod:
                AndroidSmsAutofillMethod.smsUserConsentApi,
                listenForMultipleSmsOnAndroid: true,
                length: 6,
                preFilledWidget: Text('2'),
                // validator: (value) {
                //   return value == '222222' ? null : 'Pin is incorrect';
                // },
                // onClipboardFound: (value) {
                //   debugPrint('onClipboardFound: $value');
                //   pinController.setText(value);
                // },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) {
                  debugPrint('onCompleted: $pin');
                },
                onChanged: (value) {
                  debugPrint('onChanged: $value');
                },
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22,
                      height: 1,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomButton1(
                text: 'Next',
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'DMSansR',
                  color: Colors.white,
                ),
                elevation: 0,
                height: Get.height / 16,
                width: Get.width / 2.3,
                color: Color(0xff2A70C8),
                onPressed: () {
                  Get.to(SignUpPhoneDetailsScreen());
                }),
          ],
        ),
      ),
    );
  }
}
