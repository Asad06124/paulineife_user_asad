import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paulineife_user/controller/registration_controller.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/custom_buttom.dart';

class ReportScreen extends StatelessWidget {
  ReportScreen({Key? key}) : super(key: key);
  var controller = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    List txt = [
      'It’s a spam',
      'Suicide or self-injury',
      'Hate speech or symbols',
      'Nudity or sexual activity',
      'Violence or dangerous organization',
      'Bullying or harassment',
      'I just don’t like it',
      'False information',
      'Sale of illegal or regulated goods',
      'Scam or fraud',
      'Intecllectual property violation',
      'Eating disorders'
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Report',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xff000000),
                fontFamily: 'DMSansR'),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Why are you reporting this post?',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff000000),
                    fontFamily: 'DMSansR'),
              ),
              Text(
                "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff79869F),
                    fontFamily: 'DMSansR'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: txt.length,
                  itemBuilder: (BuildContext context, int index) {
                    return StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return CheckboxListTile(

                            title: Text(
                              txt[index],
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff000000),
                                  fontFamily: 'DMSansR'),
                            ),
                            value: controller.isChecked.value,
                            onChanged: (newValue) {
                              setState((){
                                controller.isChecked.value = newValue!;
                              });

                            },
                          );
                        }
                    )
                    ;
                  },
                ),
              ),
              CustomButton1(
                text: 'Edit Profile',
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'DMSansR',
                  color: Colors.black,
                ),
                elevation: 0,
                height: Get.height / 16,
                width: Get.width / 1.2,
                color: Color(0xffE2E4EB),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
