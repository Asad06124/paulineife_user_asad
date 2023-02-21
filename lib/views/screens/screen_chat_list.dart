import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/custom_input_field1.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.sp,
          ),
          Padding(
            padding: EdgeInsets.all(8.sp),
            child: CustomInputField1(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.sp),
                borderSide: BorderSide.none,
              ),
              fillColor: Color(0xffE2E4EB),
              suffix: Icon(Icons.search),
              contentPadding:
              EdgeInsets.symmetric(horizontal: 10.sp, vertical: 15.sp),
              hint: 'Search',
              hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSansR',
                  color: Color(0xff79869F)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.sp),
            child: Text(
              'Search Result',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff000000),
                  fontFamily: 'DMSansR'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25.sp,
                    backgroundImage: NetworkImage(
                        'https://scontent.fmux2-1.fna.fbcdn.net/v/t39.30808-1/272115146_318883370152289_959529854943140445_n.jpg?stp=dst-jpg_p320x320&_nc_cat=108&ccb=1-7&_nc_sid=7206a8&_nc_eui2=AeER8e_80iKZdwjcaOaYxI1TpAWJ6Ibe0aGkBYnoht7RoZqJnOjYQAQ8zZmMfQAlOpcuioT9QJUL6AWxPJjtPD4c&_nc_ohc=PbdR0oi8fO4AX-4bc1j&_nc_oc=AQlJbCFHjlYmIgzWZ16z2DhDZDL3Tqq8R1tDCrbL2sXH0GTClKrsojCaWXETXFnfeuc&_nc_ht=scontent.fmux2-1.fna&oh=00_AfDDCBXpYFxdoHdqf5NwfzCB03Buq9J3bUP3KUnqO17WCQ&oe=63F67873'),
                  ),
                  title: Text(
                    'Asad',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff000000),
                        fontFamily: 'DMSansR'),
                  ),
                  subtitle: Text(
                    'Hi, Asad how are you',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff79869F),
                        fontFamily: 'DMSansR'),
                  ),
                  trailing: Badge(
                    label: Text('1'),
                    backgroundColor: Colors.blue,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
