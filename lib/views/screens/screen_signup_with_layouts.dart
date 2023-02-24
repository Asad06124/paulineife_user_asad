import 'package:flutter/material.dart';
import 'package:paulineife_user/views/layouts/layout_signup_phone.dart';
import 'package:sizer/sizer.dart';

class ScreeSignUpWithLayouts extends StatefulWidget {
  const ScreeSignUpWithLayouts({Key? key}) : super(key: key);

  @override
  State<ScreeSignUpWithLayouts> createState() => _ScreeSignUpWithLayoutsState();
}

class _ScreeSignUpWithLayoutsState extends State<ScreeSignUpWithLayouts> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Padding(
              padding: EdgeInsets.only(top: 10.sp),
              child: Text(
                'Sign Up',
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
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                TabBar(
                  tabs: [
                    Text(
                      "Phone",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'DMSansR'),
                    ),
                    Text(
                      "Email",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'DMSansR'),
                    ),
                  ],
                  splashFactory: InkSplash.splashFactory,
                  labelPadding: EdgeInsets.only(bottom: 3),
                  labelColor: Color(0xff2A70C8),
                  unselectedLabelColor: Color(0xffBBBFD0),
                  indicatorWeight: 2,
                  indicatorColor: Color(0xff2A70C8),
                  padding:
                      EdgeInsets.only(top: 25, left: 40, right: 40, bottom: 45),
                ),
                Expanded(
                  child: TabBarView(children: [
                    SignUpGoogleScreen()
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}
