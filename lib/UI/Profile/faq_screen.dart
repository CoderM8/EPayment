import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/res.dart';

import '../../Constant/text_widget.dart';

class Faq {
  final String title;
  final String subTitle;

  Faq({required this.title, required this.subTitle});
}

class FAQScreen extends StatelessWidget {
  FAQScreen({super.key});

  TextEditingController search = TextEditingController();

  List<Faq> faq = [
    Faq(
        title: 'How do I create a Smartpay account?',
        subTitle: 'You can create a Smartpay account by: download and open the smartpay application first then select ...'),
    Faq(
        title: 'How to create a card for Smartpay?',
        subTitle: 'You can select the create card menu then select "Add New Card" select the continue button then you ...'),
    Faq(
        title: 'How to Top Up on Smartpay?',
        subTitle: 'Click the Top Up menu then select the amount of money and the method then click the "top up now" button...'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leadingWidth: 70.w,
        leading: BackButtonWidget(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextModel(
              text: 'You have any question ?',
              fontSize: 24.sp,
              fontFamily: 'B',
            ),
            SizedBox(height: 20.h),
            TextFieldModel(hint: 'Search', controller: search, textInputType: TextInputType.text, svgUrl: R.search),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextModel(
                  text: 'Frequently Asked',
                  fontSize: 20.sp,
                  fontFamily: 'B',
                  color: black,
                ),
                TextModel(
                  text: 'View All',
                  fontSize: 16.sp,
                  fontFamily: 'B',
                  color: black,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: faq.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 126.h,
                      padding: EdgeInsets.all(20.w),
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r), border: Border.all(color: grey.withOpacity(0.2), width: 1.w)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextModel(
                            text: faq[index].title,
                            fontSize: 16.sp,
                            fontFamily: 'B',
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 8.h),
                          TextModel(
                            text: faq[index].subTitle,
                            fontSize: 12.sp,
                            fontFamily: 'R',
                            textAlign: TextAlign.start,
                            color: grey,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(height: 35.h),
            ButtonWidget(titleColor: blue, title: 'Load more', buttonColor: grey.withOpacity(0.1), onTap: () {}),
          ],
        ),
      ),
    );
  }
}
