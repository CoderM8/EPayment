import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/Controller/phonebook_controller.dart';
import 'package:onlinepayment/UI/Bottom/bottom_screen.dart';
import 'package:onlinepayment/res.dart';

class PhoneBookScreen extends StatelessWidget {
  PhoneBookScreen({super.key});

  PhoneBookController phoneBookController = Get.put(PhoneBookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 70.w,
        leading: BackButtonWidget(),
        title: TextModel(
          text: 'Phonebook',
          fontSize: 20.sp,
          fontFamily: 'B',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldModel(hint: 'Search', controller: phoneBookController.search, textInputType: TextInputType.text, svgUrl: R.search),
              SizedBox(height: 32.h),
              TextModel(
                text: 'Recent contacts',
                fontSize: 20.sp,
                fontFamily: 'B',
                color: grey,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    if (index == 3) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(color: grey.withOpacity(0.2)),
                          SizedBox(height: 5.h),
                          TextModel(
                            text: 'All Contacts',
                            fontFamily: 'B',
                            fontSize: 20.sp,
                            textAlign: TextAlign.start,
                            color: grey,
                          ),
                          SizedBox(height: 16.h),
                        ],
                      );
                    } else {
                      return SizedBox(height: 10.h);
                    }
                  },
                  itemCount: phoneBookController.contactList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          isDismissible: false,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: DraggableScrollableSheet(
                              maxChildSize: 0.7,
                              initialChildSize: 0.7,
                              builder: (BuildContext context, ScrollController scrollController) {
                                return Container(
                                  padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 20.h),
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40.r), topRight: Radius.circular(40.r))),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(R.topupsuccess),
                                      SizedBox(
                                        height: 22.h,
                                      ),
                                      TextModel(
                                        text: 'Top Up Success',
                                        fontFamily: 'B',
                                        fontSize: 24.sp,
                                      ),
                                      SizedBox(
                                        height: 12.h,
                                      ),
                                      TextModel(
                                        text: 'Top up are reviewed which may result in delays\nor funds being frozen',
                                        fontFamily: 'R',
                                        color: grey,
                                        fontSize: 11.sp,
                                      ),
                                      Spacer(),
                                      ButtonWidget(
                                          titleColor: white,
                                          title: 'Back to Home',
                                          onTap: () {
                                            Get.back();
                                            Get.off(() => BottomScreen());
                                          }),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                      tileColor: white,
                      leading: Image.asset(phoneBookController.contactList[index].imgUrl),
                      title: TextModel(
                        text: phoneBookController.contactList[index].title,
                        fontFamily: 'B',
                        fontSize: 16.sp,
                        textAlign: TextAlign.start,
                      ),
                      subtitle: TextModel(
                        text: phoneBookController.contactList[index].subTitle,
                        fontFamily: 'M',
                        fontSize: 12.sp,
                        textAlign: TextAlign.start,
                        color: grey,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
