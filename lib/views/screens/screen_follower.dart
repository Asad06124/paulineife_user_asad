import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/views/screens/screen_chat.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/custom_buttom.dart';
import '../../widgets/custom_input_field1.dart';

class FollowerScreen extends StatelessWidget {
  const FollowerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          title: Text(
            'Followers',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.sp,vertical: 10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.sp,
              ),
              CustomInputField1(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.sp),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color(0xffE2E4EB),
                prefix: Icon(Icons.search),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.sp, vertical: 15.sp),
                hint: 'Search',
                hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    
                    color: Color(0xff79869F)),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0),
                      leading: Container(
                        padding: EdgeInsets.all(2.sp),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1.sp,
                              color: Color(0xff2A70C8),
                            )),
                        child: CircleAvatar(
                          radius: 25.sp,
                          backgroundImage: AssetImage(
                              'assets/images/12.png'),
                        ),
                      ),
                      title: Text(
                        'Asad',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff000000),
                            ),
                      ),
                      subtitle: Text(
                        '@asad',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff2A70C8),
                            ),
                      ),
                      trailing: ElevatedButton(
                        child: Text(
                          'Follow',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {},
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xdff2A70C8)),
                        ),
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
