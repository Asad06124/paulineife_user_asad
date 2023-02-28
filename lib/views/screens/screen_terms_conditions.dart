import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/views/screens/screen_home.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/custom_buttom.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var WHeight = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(top: 10.sp),
            child: Text(
              'Terms & Conditions',
              style: TextStyle(
                  fontSize: 21.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'DMSansR',
                  color: Colors.black),
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(24.sp),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ac hendrerit leo, vel volutpat lectus\n\n.Cras finibus mi diam. Donec nisi orci, varius nec lectus at, tincidunt posuere mauris.\n\nCras cursus quis mi sed tempor. Praesent ac lectus ut libero pharetra egestas. ',
                style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'DMSansR',
                    color: Colors.black),
                textAlign: TextAlign.justify,
              ),
            ),
            Spacer(),
            CustomButton1(
              text: 'Agree',
              color: Color(0xff2A70C8),
              width: WHeight.width / 1.2,
              height: WHeight.height / 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.sp)),
              ),
              textStyle: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'DMSansR'),
              onPressed: () {
                Get.to(HomeScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
