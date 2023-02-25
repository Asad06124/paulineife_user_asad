import 'package:auto_size_text/auto_size_text.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CommentsScreen extends StatelessWidget {
  CommentsScreen({Key? key, required this.COntroller}) : super(key: key);
  var COntroller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
              COntroller.play();
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Divider(
                thickness: 2.sp,
                color: Color(0xffE2E4EB),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 5.sp),
                    child: CircleAvatar(
                      radius: 25.sp,
                      backgroundImage: AssetImage('assets/images/12.png'),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 3.5.w),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Asad . ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'DMSansR',
                              color: Color(0xff000000),
                            ),
                            children: [
                              TextSpan(
                                text: ' 5h ago',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'DMSans-Bold',
                                  color: Color(0xff97A1B4),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10.sp,right: 10.sp),
                        width: 69.w,
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ac hendrerit leo.',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontFamily: 'DMSansR'),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Icon(
                        Icons.more_vert,
                        color: Color(0xff97A1B4),
                      ),
                      SizedBox(height: 1.5.h,),
                      Padding(
                        padding:  EdgeInsets.only(right: 10.sp),
                        child: FavoriteButton(
                          valueChanged: (_isFavorite) {},
                          iconSize: 40.sp,
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          );
        },
      ),
      floatingActionButton: Row (

        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(
                              fontSize: 16, color: Color(0xff9C9EB9)),
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 0.0),
                            hintText: 'Message...',
                            hintStyle: TextStyle(
                              color: Color(0xff8E8E93),
                            ),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      Icon(Icons.attach_file),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.camera_alt),
                      SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
           CircleAvatar(
             backgroundColor: Colors.black,
            radius: 20,
            child: Icon(
              Icons.mic,
              size: 19,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
