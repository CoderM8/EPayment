// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/color.dart';

class TextFieldModel extends GetView {
  const TextFieldModel(
      {Key? key,
      required this.hint,
      this.label,
      required this.controller,
      required this.textInputType,
      this.obscureText,
      this.onTap,
      this.svgUrl,
      this.focusNode,
      this.validation,
      this.onChanged,
      this.onFieldSubmitted,
      this.maxLan,
      this.suffixIcon,
      this.prefixIcon,
      this.minLine,
      this.textInputAction,
      this.maxLine,
      this.expands,
      this.enabled,
      this.hideBorder = false,
      this.readOnly,
      this.color,
      this.contentPaddingH,
      this.borderRadius,
      this.fontSize,
      this.fillColor})
      : super(key: key);

  @override
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool? expands;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final void Function(String)? onFieldSubmitted;
  final String hint;
  final String? label;
  final String? Function(String?)? validation;
  final bool? obscureText;
  final int? maxLan;
  final int? maxLine;
  final int? minLine;
  final bool? enabled;
  final bool? hideBorder;
  final bool? readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? color;
  final Color? fillColor;
  final double? contentPaddingH;
  final double? borderRadius;
  final double? fontSize;
  final String? svgUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: TextModel(text: label!, fontSize: 16.sp, fontFamily: "M", color: grey),
          ),
          SizedBox(height: 8.h),
        ],
        TextFormField(
          readOnly: readOnly ?? false,
          onChanged: onChanged,
          onTap: onTap,
          onFieldSubmitted: onFieldSubmitted,
          enabled: enabled,
          maxLines: maxLine,
          minLines: minLine,
          maxLength: maxLan,
          expands: expands ?? false,
          validator: validation,
          focusNode: focusNode,
          keyboardType: textInputType,
          textInputAction: textInputAction,
          style: TextStyle(fontSize: fontSize ?? 16.sp, color: color ?? black, fontFamily: 'R'),
          controller: controller,
          inputFormatters: textInputType == TextInputType.numberWithOptions(signed: true) ? [FilteringTextInputFormatter.digitsOnly] : null,
          obscureText: obscureText ?? false,
          autofocus: false,
          cursorColor: black,
          decoration: InputDecoration(
            contentPadding: contentPaddingH != null ? EdgeInsets.symmetric(horizontal: contentPaddingH!) : null,
            counterStyle: TextStyle(color: color ?? black),
            fillColor: fillColor ?? grey.withOpacity(0.1),
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 16.r)),
                borderSide: hideBorder == false ? BorderSide(width: 1.w, color: black) : BorderSide.none),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 16.r)),
                borderSide: hideBorder == false ? BorderSide(width: 1.w, color: white) : BorderSide.none),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 16.r)),
                borderSide: hideBorder == false ? BorderSide(width: 1.w, color: white) : BorderSide.none),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 16.r)),
                borderSide: hideBorder == false ? BorderSide(width: 1.w, color: white) : BorderSide.none),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 16.r)),
                borderSide: hideBorder == false ? BorderSide(width: 1.w, color: const Color(0xffDC3545)) : BorderSide.none),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 16.r)),
                borderSide: hideBorder == false ? BorderSide(width: 1.w, color: const Color(0xffDC3545)) : BorderSide.none),
            hintText: hint,
            hintStyle: TextStyle(fontSize: 16.sp, color: grey, fontFamily: 'R'),
            errorStyle: TextStyle(fontSize: 14.sp, color: const Color(0xffDC3545), fontFamily: 'R'),
            suffixIconConstraints: BoxConstraints(minHeight: 30.h, minWidth: 24.w),
            suffixIcon: suffixIcon,
            prefixIcon: svgUrl == null
                ? prefixIcon
                : Padding(
                    padding: EdgeInsets.all(15.r),
                    child: SvgPicture.asset(
                      svgUrl!,
                      color: black,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}

class TextModel extends StatelessWidget {
  const TextModel({
    Key? key,
    required this.text,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.letterSpacing,
    this.height,
    this.fontFamily,
    this.textDecoration,
  }) : super(key: key);

  final String text;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? fontSize;
  final double? letterSpacing;
  final double? height;
  final FontWeight? fontWeight;
  final Color? color;
  final String? fontFamily;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: true,
      style: TextStyle(
          fontSize: fontSize ?? 20.sp,
          fontWeight: fontWeight,
          color: color ?? blue,
          letterSpacing: letterSpacing,
          height: height,
          fontFamily: fontFamily ?? "B",
          decoration: textDecoration),
    );
  }
}
