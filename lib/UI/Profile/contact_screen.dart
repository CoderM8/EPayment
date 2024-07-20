import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/UI/TopUp/selectprovider_screen.dart';
import '../../Controller/phonebook_controller.dart';
import '../../res.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({super.key});

  TextEditingController search = TextEditingController();

  List<ContactList> contactList = [
    ContactList(title: 'Linda John', imgUrl: R.p1, subTitle: '**** **** **** 2564'),
    ContactList(title: 'David William', imgUrl: R.p2, subTitle: '**** **** **** 2569'),
    ContactList(title: 'Susan Charles', imgUrl: R.p3, subTitle: '**** **** **** 3596'),
    ContactList(title: 'Sarah Sam', imgUrl: R.p4, subTitle: '**** **** **** 3781'),
    ContactList(title: 'Monica Jess', imgUrl: R.p5, subTitle: '**** **** **** 2510'),
    ContactList(title: 'Loran Hailey', imgUrl: R.p6, subTitle: '**** **** **** 7458'),
  ];

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
              TextFieldModel(hint: 'Search', controller: search, textInputType: TextInputType.text, svgUrl: R.search),
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
                    if (index == 2) {
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
                  itemCount: contactList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Get.to(() => SelectProviderScreen());
                      },
                      tileColor: white,
                      leading: Image.asset(contactList[index].imgUrl),
                      title: TextModel(
                        text: contactList[index].title,
                        fontFamily: 'B',
                        fontSize: 16.sp,
                        textAlign: TextAlign.start,
                      ),
                      subtitle: TextModel(
                        text: contactList[index].subTitle,
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
