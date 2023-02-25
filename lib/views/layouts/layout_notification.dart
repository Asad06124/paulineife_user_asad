import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class NotificationLayouts extends StatelessWidget {
  const NotificationLayouts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Notifications',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xff000000),
                fontFamily: 'DMSansR'),
          ),
        ),
        body: Column(
          children:[
            Padding(
              padding: EdgeInsets.all(8.sp),
              child: Text(
                'Recent Searches',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff000000),
                    fontFamily: 'DMSansR'),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 25.sp,
                      backgroundImage: AssetImage(
                          'assets/images/12.png'),
                    ),
                    title: Text(
                      'Asad commented on your post.',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff000000),
                          fontFamily: 'DMSansR'),
                    ),
                    subtitle: Text(
                      '45 minutes ago',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff79869F),
                          fontFamily: 'DMSansR'),
                    ),
                    trailing: SvgPicture.asset('assets/images/Vector.svg'),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
