import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ola_like_country_picker/ola_like_country_picker.dart';
import 'package:paulineife_user/views/screens/screen_signup_details.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/custom_buttom.dart';

class SignUpPhoneScreen extends StatefulWidget {
  SignUpPhoneScreen({Key? key}) : super(key: key);

  @override
  State<SignUpPhoneScreen> createState() => _SignUpPhoneScreenState();
}

class _SignUpPhoneScreenState extends State<SignUpPhoneScreen> {
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff9f9f9),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Container(
                        height: Get.height / 12,
                        width: 60.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(
                            color: Color(0xffD6D9E3),
                          ),
                          color: Color(0xffFFFFFF),
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${country.code} ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                      
                                      color: Color(0xff79869F)),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: Colors.black,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5.sp,
                            ),
                            Text(
                              '${country.dialCode}',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        c.launch(context);
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5.sp),
                      padding: EdgeInsets.only(top: 12.sp),
                      height: Get.height / 12,
                      width: Get.width / 1.6,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffD6D9E3),
                          ),
                          color:  Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: TextEditingController(text: '123456789'),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffFFFFFF),
                          label: Text('Phone Number'),
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
                  ],
                ),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [],
                  ),
                  Row(
                    children: [
                      CustomButton1(
                          text: 'Send Code',
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            
                            color: Colors.white,
                          ),
                          elevation: 0,
                          height: 45.sp,
                          width: 115.sp,
                          color: Color(0xff2A70C8),
                          onPressed: () {}),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Ink(
                        decoration: const ShapeDecoration(
                          color: Color(0xffE2E4EB),
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.refresh,
                            color: Colors.black,
                          ),
                          color: Color(0xffE2E4EB),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Verify Code',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    
                    color: Colors.black),
              ),
              // Directionality(
              //   // Specify direction if desired
              //   textDirection: TextDirection.ltr,
              //   child: ,
              // ),
              SizedBox(height: 10.sp,),
              Container(
                height: 40.sp,
                width: Get.width*.8,
                // padding: EdgeInsets.symmetric(vertical: 10.sp,horizontal: 20.sp),
                child: Pinput(
                  scrollPadding: EdgeInsets.all(10.sp),
                  controller: pinController,
                  focusNode: focusNode,
                  androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
                  listenForMultipleSmsOnAndroid: true,
                  length: 6,
                  preFilledWidget: Text('2',style: TextStyle(color: Colors.black,),),
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
                  // cursor: Container(
                  //   margin: const EdgeInsets.only(bottom: 9),
                  //   width: 22,
                  //   height: 1,
                  // ),
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
                    
                    color: Colors.white,
                  ),
                  elevation: 0,
                  height: 45.sp,
                  width: 115.sp,
                  color: Color(0xff2A70C8),
                  onPressed: () {
                    Get.to(SignUpPhoneDetailsScreen());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
