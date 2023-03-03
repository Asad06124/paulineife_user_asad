import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:get/get.dart';
import 'package:paulineife_user/views/screens/screen_chat.dart';
import 'package:sizer/sizer.dart';

import '../../helpers/theme_service.dart';
import '../../widgets/custom_input_field1.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
        body: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.sp,
              ),
              CustomInputField1(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.sp),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color(0xffE2E4EB),
                prefix: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 15.sp),
                hint: 'Search',
                hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff79869F)),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Text(
                'Messgaes',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0),
                      onTap: () {
                        Get.to(ChatScreen());
                      },
                      leading: CircleAvatar(
                        radius: 25.sp,
                        backgroundImage: AssetImage('assets/images/12.png'),
                      ),
                      title: Text(
                        'Asad',
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black),
                      ),
                      subtitle: Text(
                        'Hi, Asad how are you',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff79869F),
                        ),
                      ),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '10:12 am',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff79869F),
                            ),
                          ),
                          Badge(
                            badgeContent: Text(
                              '1',
                              style: TextStyle(
                                color: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
                              ),
                            ),
                            badgeStyle: BadgeStyle(badgeColor: Colors.blue),
                            // backgroundColor: Colors.blue,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
