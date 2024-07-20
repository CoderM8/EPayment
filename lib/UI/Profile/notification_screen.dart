import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlinepayment/Constant/color.dart';

import '../../Constant/button_widget.dart';
import '../../Constant/text_widget.dart';
import '../../Controller/phonebook_controller.dart';
import '../../res.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  List<ContactList> contactList = [
    ContactList(title: 'Rewards', imgUrl: R.reward, subTitle: 'Loyal user rewards!😘', time: '5m ago'),
    ContactList(title: 'Money Transfer', imgUrl: R.withdraw, subTitle: 'You have successfully sent money to Maria of...', time: '25m ago'),
    ContactList(title: 'Payment Notification', imgUrl: R.creditcard, subTitle: 'Successfully paid!🤑', time: 'Mar 20'),
    ContactList(title: 'Top Up', imgUrl: R.deposit, subTitle: 'Your top up is successfully!', time: 'Mar 18'),
    ContactList(title: 'Money Transfer', imgUrl: R.withdraw, subTitle: 'You have successfully sent money to Maria of...', time: 'Mar 11'),
    ContactList(title: 'Cashback 25%', imgUrl: R.discount, subTitle: 'You have successfully sent money to Maria of...', time: 'Mar 04'),
    ContactList(title: 'Payment Notification', imgUrl: R.creditcard, subTitle: 'Successfully paid!🤑', time: 'Mar 02'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        leadingWidth: 70.w,
        leading: BackButtonWidget(),
        title: TextModel(
          text: 'Notification',
          fontSize: 20.sp,
          color: black,
          fontFamily: 'B',
        ),
        actions: [
          BackButtonWidget(svgUrl: R.doublecheck),
          SizedBox(width: 15.w),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextModel(
                text: 'Today',
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
                    if (index == 1) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(color: grey.withOpacity(0.2)),
                          SizedBox(height: 5.h),
                          TextModel(
                            text: 'This Week',
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
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                      leading: Container(
                          height: 48.w,
                          width: 48.w,
                          decoration: BoxDecoration(
                            color: lightgrey.withOpacity(1),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.w),
                            child: SvgPicture.asset(contactList[index].imgUrl),
                          )),
                      title: TextModel(
                        text: contactList[index].title,
                        fontFamily: 'B',
                        fontSize: 16.sp,
                        textAlign: TextAlign.start,
                      ),
                      subtitle: TextModel(
                        text: contactList[index].subTitle,
                        fontFamily: 'R',
                        fontSize: 12.sp,
                        textAlign: TextAlign.start,
                        color: grey,
                      ),
                      trailing: TextModel(
                        text: contactList[index].time!,
                        fontFamily: 'R',
                        fontSize: 12.sp,
                        color: grey,
                        textAlign: TextAlign.start,
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
