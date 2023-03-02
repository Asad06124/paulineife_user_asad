import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List title = [
      'FAQ &  Contact Support',
      'About Us',
      'Terms & Conditions',
      'Privacy Policy',
      'Log out',
    ];
    List lead = [
      Icons.chat_bubble_outline,
      Icons.info_outline_rounded,
      Icons.view_list_sharp,
      Icons.privacy_tip,
      Icons.logout,
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Setting'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: title.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: Get.height/13,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color:  Color(0xffE2E4EB),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(8.sp),
              child: ListTile(
                enabled: true,
                leading: Icon(
                  lead[index],
                  color: Colors.black,
                ),
                title: Text(
                  title[index],
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded,color: Color(0xff97A1B4),),
              ),
            );
          },
        ),
      ),
    );
  }
}
