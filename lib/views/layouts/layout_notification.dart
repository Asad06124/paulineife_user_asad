import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../helpers/theme.dart';
import '../../helpers/theme_service.dart';

class NotificationLayouts extends StatelessWidget {
  const NotificationLayouts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
        appBar: AppBar(
          title: Text(
            'Notifications',
            style: getAppbarTextTheme().copyWith(fontSize: 18),
          ),
          centerTitle: true,
          automaticallyImplyLeading: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Today',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black),
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        leading: CircleAvatar(
                          radius: 25.sp,
                          backgroundImage: AssetImage('assets/images/12.png'),
                        ),
                        title: RichText(
                          text: TextSpan(
                              text: 'Asad',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: ' commented on your ',
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.w400, color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black),
                                ),
                                TextSpan(
                                  text: ' post.',
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.w700, color: ThemeService.isSavedDarkMode() ? Colors.white : Colors.black),
                                ),
                              ]),
                        ),
                        subtitle: Text(
                          '45 minutes ago',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff79869F),
                          ),
                        ),
                        trailing: Icon(
                          Icons.more_vert,
                          color: Color(0xff97A1B4),
                        ));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
