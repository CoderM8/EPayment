import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/res.dart';

import '../../Constant/color.dart';
import '../../Controller/selectprovider_controller.dart';

class SelectLanguageScreen extends StatelessWidget {
  SelectLanguageScreen({super.key});

  TextEditingController search = TextEditingController();

  final RxInt isSelected = 0.obs;

  List<SelectTopup> lanList = [
    SelectTopup(title: 'India', imgUrl: '🇮🇳'),
    SelectTopup(title: 'English (US)', imgUrl: '🇺🇸'),
    SelectTopup(title: 'English (UK)', imgUrl: '🇬🇧'),
    SelectTopup(title: 'Indonesian', imgUrl: '🇮🇩'),
    SelectTopup(title: 'Russia', imgUrl: '🇷🇺'),
    SelectTopup(title: 'French', imgUrl: '🇫🇷'),
    SelectTopup(title: 'Chinese', imgUrl: '🇨🇳'),
    SelectTopup(title: 'Japanese', imgUrl: '🇯🇵'),
    SelectTopup(title: 'Germany', imgUrl: '🇩🇪'),
    SelectTopup(title: 'Pakistan', imgUrl: '🇵🇰'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 70.w,
        leading: BackButtonWidget(),
        title: TextModel(
          text: 'Select Language',
          fontSize: 20.sp,
          fontFamily: 'B',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              TextFieldModel(
                hint: 'Search',
                controller: search,
                textInputType: TextInputType.text,
                svgUrl: R.search,
              ),
              SizedBox(height: 20.h),
              ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: lanList.length,
                  separatorBuilder: (context, index) {
                    return SizedBox();
                  },
                  itemBuilder: (context, index) {
                    return Obx(() {
                      return ListTile(
                          splashColor: Colors.transparent,
                          onTap: () {
                            isSelected.value = index;
                          },
                          tileColor: white,
                          leading: TextModel(
                            text: lanList[index].imgUrl,
                            fontFamily: 'B',
                            fontSize: 20.sp,
                            textAlign: TextAlign.start,
                          ),
                          title: TextModel(
                            text: lanList[index].title,
                            fontFamily: 'B',
                            fontSize: 16.sp,
                            color: black,
                            textAlign: TextAlign.start,
                          ),
                          trailing: isSelected.value == index
                              ? SvgPicture.asset(R.check)
                              : Container(
                                  height: 24.w,
                                  width: 24.w,
                                  decoration:
                                      BoxDecoration(shape: BoxShape.circle, border: Border.all(color: grey.withOpacity(0.2), width: 1.w)),
                                ));
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
