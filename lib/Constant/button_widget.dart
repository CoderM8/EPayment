// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/color.dart';

import '../res.dart';
import 'text_widget.dart';

class ButtonWidget extends GetView {
  const ButtonWidget(
      {Key? key,
      this.title,
      required this.titleColor,
      this.buttonColor,
      required this.onTap,
      this.width,
      this.height,
      this.borderRadius,
      this.isBorder = false,
      this.fontWeight,
      this.icon})
      : super(key: key);
  final String? title;
  final Color titleColor;
  final Color? buttonColor;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final double? borderRadius;
  final bool? isBorder;
  final FontWeight? fontWeight;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 56.h,
        width: width ?? MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            color: isBorder == true ? Colors.transparent : buttonColor ?? blue,
            borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
            border: isBorder == true ? Border.all(color: grey.withOpacity(0.1), width: 1.w) : null),
        child: icon == null
            ? Center(
                child:
                    TextModel(text: title!, color: titleColor, fontFamily: 'B', fontSize: 16.sp, fontWeight: fontWeight ?? FontWeight.bold))
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon!,
                  // SizedBox(width: 8.w),
                  // Center(
                  //     child: TextModel(
                  //         text: title, color: titleColor, fontFamily: 'B', fontSize: 16.sp, fontWeight: fontWeight ?? FontWeight.bold)),
                ],
              ),
      ),
    );
  }
}

class BackButtonWidget extends GetView {
  const BackButtonWidget(
      {Key? key,
      this.height,
      this.width,
      this.svgUrl,
      this.onTap,
      this.ismargin = false,
      this.margin,
      this.alignment,
      this.backGroundColor,
      this.hideBorder = false,
      this.iconColor})
      : super(key: key);
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final Color? backGroundColor;
  final Color? iconColor;
  final bool? hideBorder;
  final bool? ismargin;
  final String? svgUrl;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? AlignmentDirectional.centerStart,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap ??
            () {
              Get.back();
            },
        child: Container(
          height: 40.w,
          width: 40.w,
          padding: EdgeInsets.all(10.r),
          margin: ismargin == false ? EdgeInsets.only(left: 24.w) : null,
          decoration: BoxDecoration(
            color: backGroundColor,
            borderRadius: BorderRadius.circular(12.r),
            border: hideBorder == false ? Border.all(width: 1.w, color: grey.withOpacity(0.3)) : null,
          ),
          child: SvgPicture.asset(svgUrl ?? R.leftarrow, color: iconColor, height: 12.h, width: 6.w),
        ),
      ),
    );
  }
}
