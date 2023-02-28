import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../layouts/layout_forget_password_email.dart';
import '../layouts/layout_forget_password_phone.dart';

class ScreeForgetPasswordWithLayouts extends StatefulWidget {
  const ScreeForgetPasswordWithLayouts({Key? key}) : super(key: key);

  @override
  State<ScreeForgetPasswordWithLayouts> createState() => _ScreeForgetPasswordWithLayoutsState();
}

class _ScreeForgetPasswordWithLayoutsState extends State<ScreeForgetPasswordWithLayouts> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Color(0xfff9f9f9),
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Padding(
                padding: EdgeInsets.only(top: 10.sp),
                child: Text(
                  'Forget Password',
                  style: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'DMSansR',
                      color: Colors.black),
                ),
              ),
              automaticallyImplyLeading: false,
              centerTitle: true,
              elevation: 0,
              backgroundColor: Color(0xfff9f9f9),
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
                      ForgetPasswordPhoneScreen(),
                      ForgetPasswordEmailScreen()
                    ]),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
