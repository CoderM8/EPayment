import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/Controller/mycard_controller.dart';
import 'package:onlinepayment/UI/Card/mybankcard_screen.dart';
import 'package:onlinepayment/res.dart';

class MyCardScreen extends StatelessWidget {
  MyCardScreen({super.key});

  final MyCardController myCardController = Get.put(MyCardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: TextModel(
          text: 'My Bank',
          fontSize: 20.sp,
          color: black,
          fontFamily: 'B',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextModel(
                text: 'Your bank account',
                fontSize: 24.sp,
                fontFamily: 'B',
              ),
              SizedBox(height: 24.h),
              Obx(() {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 20.w);
                  },
                  itemCount: myCardController.banks.length,
                  itemBuilder: (context, index) {
                    final banks = myCardController.banks[index];

                    print('banks--${myCardController.banks.length}');
                    return Slidable(
                      endActionPane: ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          SizedBox(width: 12.w),
                          SlidableAction(
                            onPressed: (v) {
                              myCardController.removeBank(index);
                            },
                            backgroundColor: green,
                            foregroundColor: white,
                            icon: Icons.delete_outline,
                            borderRadius: BorderRadius.circular(16.r),
                            // label: '',
                          ),
                        ],
                      ),
                      child: ListTile(
                        onTap: () {
                          Get.to(() => MyBankCardScreen());
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r), side: BorderSide(color: lightgrey.withOpacity(1), width: 1.w)),
                        tileColor: white,
                        leading: Image.asset(R.boiicon),
                        title: TextModel(
                          text: banks.bname,
                          fontFamily: 'B',
                          fontSize: 16.sp,
                          textAlign: TextAlign.start,
                        ),
                        subtitle: TextModel(
                          text: banks.cname,
                          fontFamily: 'M',
                          fontSize: 12.sp,
                          textAlign: TextAlign.start,
                          color: grey,
                        ),
                      ),
                    );
                  },
                );
              }),
              SizedBox(height: 24.h),
              ListTile(
                onTap: () {
                  Get.dialog(Dialog(
                    backgroundColor: white,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20.w, 30.h, 20.w, 20.h),
                      decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(15.r)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFieldModel(hint: 'Bank Name', controller: myCardController.bName, textInputType: TextInputType.text),
                          SizedBox(height: 20.h),
                          TextFieldModel(hint: 'Accountant Name', controller: myCardController.cName, textInputType: TextInputType.text),
                          SizedBox(height: 30.h),
                          ButtonWidget(
                              titleColor: white,
                              title: 'Add Bank',
                              onTap: () {
                                myCardController.addBank(myCardController.bName.text, myCardController.cName.text);
                                myCardController.bName.clear();
                                myCardController.cName.clear();
                                Get.back();
                              }),
                        ],
                      ),
                    ),
                  ));
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                tileColor: lightgrey.withOpacity(1),
                leading: SvgPicture.asset(R.bank),
                title: TextModel(
                  text: 'Add new bank',
                  fontFamily: 'B',
                  fontSize: 16.sp,
                  textAlign: TextAlign.start,
                ),
                trailing: SvgPicture.asset(R.right_arrow),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
