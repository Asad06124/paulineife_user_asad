import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PostImageScreen extends StatelessWidget {
  const PostImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
        centerTitle: true,
        actions: [
          ElevatedButton(
              child: Text(
                'Following',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSansR',
                  color: Colors.black,
                ),
              ),
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(20.sp, 10.sp)),
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Color(0xdfffffff)),
              ),
              onPressed: () {}),
        ],
      ),
    );
  }
}
