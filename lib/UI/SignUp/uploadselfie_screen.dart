import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/res.dart';

import 'proofresidency_screen.dart';

List<CameraDescription>? cameras;

class UploadSelfieScreen extends StatefulWidget {
  UploadSelfieScreen({super.key});

  @override
  State<UploadSelfieScreen> createState() => _UploadSelfieScreenState();
}

class _UploadSelfieScreenState extends State<UploadSelfieScreen> {
  CameraController? cameraCtrl;

  @override
  void initState() {
    cameraCtrl = CameraController(cameras![1], ResolutionPreset.high);
    cameraCtrl!.initialize().then((_) {
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            break;
          default:
            break;
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          CameraPreview(cameraCtrl!),
          Padding(
            padding: EdgeInsets.only(top: 60.h, bottom: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    BackButtonWidget(
                      svgUrl: R.close,
                    ),
                    SizedBox(width: 35.w),
                    TextModel(text: 'Focus on your face', fontFamily: 'B', fontSize: 24.sp, textAlign: TextAlign.start),
                  ],
                ),
                InkWell(
                    onTap: () {
                      Get.to(() => ProofResidencyScreen());
                    },
                    child: SvgPicture.asset(R.camera)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
