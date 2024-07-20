import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/Controller/help_controller.dart';
import 'package:onlinepayment/res.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../Constant/button_widget.dart';
import '../../Constant/color.dart';

class HelpScreen extends StatelessWidget {
  HelpScreen({super.key});

  HelpController helpController = Get.put(HelpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        centerTitle: true,
        leadingWidth: 70.w,
        leading: BackButtonWidget(iconColor: white),
        title: TextModel(
          text: 'Co Help',
          fontSize: 20.sp,
          color: white,
          fontFamily: 'B',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 20.h, right: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40.w,
                  width: 40.w,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: green, shape: BoxShape.circle),
                  child: SvgPicture.asset(R.robot),
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.only(top: 12.h, bottom: 12.h, left: 20.w, right: 20.w),
                  decoration: BoxDecoration(
                      color: grey.withOpacity(0.1),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16.r), bottomLeft: Radius.circular(16.r), bottomRight: Radius.circular(16.r))),
                  child: TextModel(
                    text: 'Hello! Tommy 👋. I can converse in your preferred language. Howmay I help you today?',
                    color: black,
                    textAlign: TextAlign.start,
                    fontFamily: 'M',
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: helpController.messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return helpController.messages[index];
                },
              );
            }),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15.w, 0.0, 15.w, 20.h),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onLongPress: () {
                    helpController.toggleRecording();
                  },
                  onLongPressEnd: (v) {
                    helpController.toggleRecording();
                  },
                  child: Container(
                    height: 63.w,
                    width: 50.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: grey.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(R.mic),
                    ),
                  ),
                ),
                SizedBox(width: 2.w),
                InkWell(
                  onTap: () async {
                    helpController.pickDocument().then((value) {
                      helpController.sendMsg(helpController.send.text, helpController.selectedImage, helpController.selectedDocument,
                          helpController.audioPath!.isNotEmpty ? helpController.audioPath : '');
                    });
                  },
                  child: Container(
                    height: 63.w,
                    width: 50.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: grey.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(R.doc),
                    ),
                  ),
                ),
                SizedBox(width: 2.w),
                InkWell(
                  onTap: () async {
                    await helpController.selectImage(imageSource: ImageSource.gallery).then((value) {
                      helpController.sendMsg(helpController.send.text, helpController.selectedImage, helpController.selectedDocument,
                          helpController.audioPath!.isNotEmpty ? helpController.audioPath : '');
                    });
                  },
                  child: Container(
                    height: 63.w,
                    width: 50.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: grey.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(R.gallery),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Flexible(
                  child: TextFieldModel(
                      controller: helpController.send,
                      textInputType: TextInputType.text,
                      hint: 'Type here...',
                      suffixIcon: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            helpController.audioPath = '';
                            helpController.sendMsg(helpController.send.text, helpController.selectedImage, helpController.selectedDocument,
                                helpController.audioPath!.isNotEmpty ? helpController.audioPath : '');
                            helpController.selectedImage = null;
                            helpController.selectedDocument = null;
                            FocusManager.instance.primaryFocus!.unfocus();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 8.0.w),
                            child: SvgPicture.asset(
                              R.send,
                              height: 30.w,
                              width: 30.w,
                            ),
                          ))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final File? image;
  final File? document;
  final String? audioFile;

  ChatMessage({required this.text, this.image, this.document, required this.audioFile});

  HelpController helpController = Get.put(HelpController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          if (text.trim().isNotEmpty)
            Container(
              padding: EdgeInsets.only(top: 12.h, bottom: 12.h, left: 20.w, right: 20.w),
              decoration: BoxDecoration(
                  color: blue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r), bottomLeft: Radius.circular(16.r), bottomRight: Radius.circular(16.r))),
              child: TextModel(
                text: text,
                color: white,
                fontFamily: 'M',
                fontSize: 14.sp,
              ),
            ),
          if (image != null)
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.file(
                  image!,
                  height: 100.w,
                  width: 100.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          if (document != null)
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: InkWell(
                onTap: () {
                  Get.to(() => PdfScreen(
                        pdf: document!,
                      ));
                },
                child: Container(
                  padding: EdgeInsets.only(top: 12.h, bottom: 12.h, left: 20.w, right: 20.w),
                  decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r), bottomLeft: Radius.circular(16.r), bottomRight: Radius.circular(16.r))),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(R.document, color: white),
                      TextModel(
                        text: helpController.docName!,
                        fontSize: 14.sp,
                        fontFamily: 'M',
                        color: white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (audioFile!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                padding: EdgeInsets.only(top: 12.h, bottom: 12.h, left: 20.w, right: 20.w),
                decoration: BoxDecoration(
                    color: blue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r), bottomLeft: Radius.circular(16.r), bottomRight: Radius.circular(16.r))),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(R.mic, color: white),
                    TextModel(
                      text: audioFile!,
                      fontSize: 14.sp,
                      fontFamily: 'M',
                      color: white,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class PdfScreen extends StatelessWidget {
  PdfScreen({super.key, required this.pdf});

  File pdf;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        leadingWidth: 70.w,
        leading: BackButtonWidget(),
        title: TextModel(
          text: 'Document',
          fontSize: 20.sp,
          fontFamily: 'B',
        ),
      ),
      body: SfPdfViewer.file(pdf),
    );
  }
}
