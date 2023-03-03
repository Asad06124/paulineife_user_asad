import 'package:custom_utils/custom_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../helpers/theme_service.dart';

class CustomContainer2 extends StatelessWidget {
  String image, text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 20.3.h,
        width: 45.w,
        decoration: BoxDecoration(
          color: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
          boxShadow: appBoxShadow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(image),
            Text(
              text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  CustomContainer2({
    required this.image,
    required this.text,
    this.onTap,
  });
}
