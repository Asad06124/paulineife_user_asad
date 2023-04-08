import 'package:custom_utils/custom_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../helpers/theme_service.dart';

class CustomButton1 extends StatefulWidget {
  final Color? color;
  final String text;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final OutlinedBorder? shape;
  final BoxDecoration? decuration;
  final bool? enabled;
  final bool? loading;
  final double? elevation;
  final Color? shadowColor;
  final Duration? animationDuration;

  CustomButton1(
      {this.color,
      required this.text,
      required this.onPressed,
      this.width,
      this.margin,
      this.decuration,
      this.height,
      this.textStyle,
      this.shape,
      this.padding,
      this.textAlign,
      this.onLongPressed,
      this.enabled,
      this.loading,
      this.elevation,
      this.shadowColor,
      this.animationDuration});

  @override
  _CustomButton1State createState() => _CustomButton1State();
}

class _CustomButton1State extends State<CustomButton1> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: 10.sp),
        margin: widget.margin ??
            const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        height: widget.height,
        width: widget.width,
        decoration: widget.decuration,
        child: ElevatedButton(
          onLongPress: widget.onLongPressed,
          onPressed: ((widget.enabled != null && !widget.enabled!) ||
                  (widget.loading != null && widget.loading!))
              ? null
              : widget.onPressed,
          style: ElevatedButton.styleFrom(
            padding: widget.padding,
            elevation: widget.elevation,
            shadowColor: widget.shadowColor,
            animationDuration: widget.animationDuration,
            primary: (widget.color ?? buttonColor),
            shape: widget.shape ??
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
          ),
          child: (widget.loading != null && widget.loading == true)
              ? CupertinoActivityIndicator()
              : Text(
                  widget.text,
                  textAlign: widget.textAlign ?? TextAlign.center,
                  style: widget.textStyle ??
                      normal_h3Style.copyWith(
                        color: ThemeService.isSavedDarkMode()
                            ? Colors.black
                            : Colors.white,
                      ),
                ),
        ),
      ),
    );
  }
}
