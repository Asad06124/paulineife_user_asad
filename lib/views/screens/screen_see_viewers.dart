import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/custom_input_field1.dart';

class SeeViewersScreen extends StatelessWidget {
  const SeeViewersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Views and likes',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              fontFamily: 'DMSansR'),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(),
              Column(
                children: [
                  Icon(
                    Icons.remove_red_eye,
                    color: Colors.black,
                    size: 30.sp,
                  ),
                  Text('10.9K'),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.favorite_outlined,
                    color: Colors.black,
                    size:30.sp
                  ),
                  Text('10.9K'),
                ],
              ),
              SizedBox(),
            ],
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
          Expanded(
            child: ListView.builder(
              itemCount: 12,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25.sp,
                    backgroundImage: AssetImage(
                        'assets/images/12.png'),
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
                    '@asad',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff2A70C8),
                        fontFamily: 'DMSansR'),
                  ),
                  trailing: ElevatedButton(
                    child: Text(
                      'Follow',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'DMSansR',
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
    );
  }
}
