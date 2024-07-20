import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/Controller/selectprovider_controller.dart';
import 'package:onlinepayment/res.dart';
import '../../Controller/withdraw_controller.dart';
import '../Bottom/bottom_screen.dart';

class SelectProviderScreen extends StatelessWidget {
  SelectProviderScreen({super.key});

  SelectProviderController selectProviderController = Get.put(SelectProviderController());
  WithDrawController withDrawController = Get.put(WithDrawController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 70.w,
        leading: BackButtonWidget(),
        title: TextModel(
          text: 'Top Up',
          fontSize: 20.sp,
          fontFamily: 'B',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextModel(
              text: 'Bank Transfer',
              fontSize: 20.sp,
              fontFamily: 'B',
            ),
            SizedBox(height: 16.h),
            ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemCount: selectProviderController.topupList.length,
                separatorBuilder: (context, index) {
                  if (index == 1) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5.h),
                        TextModel(
                          text: 'Other',
                          fontFamily: 'B',
                          fontSize: 20.sp,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 16.h),
                      ],
                    );
                  } else {
                    return SizedBox(height: 10.h);
                  }
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: Obx(() {
                      return ListTile(
                          onTap: () {
                            selectProviderController.isSelected.value = index;
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r), side: BorderSide(width: 1.w, color: grey.withOpacity(0.2))),
                          tileColor: white,
                          leading: Container(
                              height: 48.w,
                              width: 48.w,
                              decoration: BoxDecoration(color: lightgrey.withOpacity(1), shape: BoxShape.circle),
                              child: Padding(
                                padding: EdgeInsets.all(10.w),
                                child: Image.asset(selectProviderController.topupList[index].imgUrl),
                              )),
                          title: TextModel(
                            text: selectProviderController.topupList[index].title,
                            fontFamily: 'B',
                            fontSize: 16.sp,
                            textAlign: TextAlign.start,
                          ),
                          subtitle: TextModel(
                            text: selectProviderController.topupList[index].subTitle!,
                            fontFamily: 'M',
                            fontSize: 12.sp,
                            textAlign: TextAlign.start,
                            color: grey,
                          ),
                          trailing: selectProviderController.isSelected.value == index
                              ? SvgPicture.asset(R.check)
                              : Container(
                                  height: 24.w,
                                  width: 24.w,
                                  decoration:
                                      BoxDecoration(shape: BoxShape.circle, border: Border.all(color: grey.withOpacity(0.2), width: 1.w)),
                                ));
                    }),
                  );
                }),
            Spacer(),
            ButtonWidget(
                titleColor: white,
                title: 'Confirm',
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
                        maxChildSize: 0.8,
                        initialChildSize: 0.8,
                        builder: (BuildContext context, ScrollController scrollController) {
                          return Container(
                            padding: EdgeInsets.fromLTRB(20.w, 40.h, 20.w, 20.h),
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(40.r), topRight: Radius.circular(40.r))),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.r), border: Border.all(color: grey.withOpacity(0.2))),
                                  child: Obx(() {
                                    return ListTile(
                                      onTap: () {},
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16.r),
                                          side: BorderSide(color: grey.withOpacity(0.2), width: 1.w)),
                                      leading: ClipRRect(
                                          borderRadius: BorderRadius.circular(100.r), child: Image.asset(withDrawController.bImage.value)),
                                      title: TextModel(
                                        text: withDrawController.bName.value,
                                        fontFamily: 'B',
                                        fontSize: 16.sp,
                                        textAlign: TextAlign.start,
                                      ),
                                      subtitle: TextModel(
                                        text: withDrawController.bNumber.value,
                                        fontFamily: 'M',
                                        fontSize: 12.sp,
                                        textAlign: TextAlign.start,
                                        color: grey,
                                      ),
                                      trailing: PopupMenuButton(
                                        color: white,
                                        icon: SvgPicture.asset(R.arrow_down),
                                        position: PopupMenuPosition.under,
                                        onSelected: (v) {
                                          withDrawController.bankList.forEach((element) {
                                            if (element.title == v) {
                                              withDrawController.bName.value = element.title.toString();
                                              withDrawController.bNumber.value = element.subTitle.toString();
                                              withDrawController.bImage.value = element.imgUrl.toString();
                                            }
                                          });
                                        },
                                        itemBuilder: (context) => withDrawController.bankList.map((item) {
                                          return PopupMenuItem(
                                            value: item.title,
                                            child: Container(
                                              width: MediaQuery.sizeOf(context).width,
                                              child: ListTile(
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                                                leading:
                                                    ClipRRect(borderRadius: BorderRadius.circular(100.r), child: Image.asset(item.imgUrl)),
                                                title: TextModel(
                                                  text: item.title,
                                                  fontFamily: 'B',
                                                  fontSize: 16.sp,
                                                  textAlign: TextAlign.start,
                                                ),
                                                subtitle: TextModel(
                                                  text: item.subTitle!,
                                                  fontFamily: 'M',
                                                  fontSize: 12.sp,
                                                  textAlign: TextAlign.start,
                                                  color: grey,
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    );
                                  }),
                                ),
                                SizedBox(height: 24.h),
                                TextModel(
                                  text: 'Amount',
                                  fontSize: 16.sp,
                                  fontFamily: 'B',
                                ),
                                SizedBox(height: 30.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    BackButtonWidget(
                                      svgUrl: R.minus,
                                      ismargin: false,
                                      onTap: () {
                                        selectProviderController.decreaseValue();
                                      },
                                    ),
                                    Row(
                                      children: [
                                        TextModel(
                                          text: '\$',
                                          fontSize: 32.sp,
                                          fontFamily: 'B',
                                          color: grey,
                                        ),
                                        SizedBox(
                                          width: 150.w,
                                          child: TextFieldModel(
                                              hideBorder: true,
                                              hint: 'Enter Price',
                                              fontSize: 32.sp,
                                              fillColor: Colors.transparent,
                                              color: blue,
                                              controller: selectProviderController.price,
                                              textInputType: TextInputType.numberWithOptions(decimal: true)),
                                        ),
                                      ],
                                    ),
                                    BackButtonWidget(
                                      svgUrl: R.plus,
                                      onTap: () {
                                        selectProviderController.increaseValue();
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Obx(() {
                                  return SliderTheme(
                                    data: const SliderThemeData(
                                        thumbColor: Colors.green, thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10)),
                                    child: Slider(
                                      activeColor: green,
                                      inactiveColor: grey.withOpacity(0.2),
                                      value: selectProviderController.hl.value,
                                      onChanged: (newValue) {
                                        double currentValue = selectProviderController.hl.value;
                                        selectProviderController.hl.value = newValue;
                                        if (newValue > currentValue) {
                                          selectProviderController.increaseValue();
                                        } else if (newValue < currentValue) {
                                          selectProviderController.decreaseValue();
                                        }
                                      },
                                    ),
                                  );
                                }),
                                SizedBox(height: 24.h),
                                GridView.builder(
                                    itemCount: selectProviderController.priceList.length,
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      mainAxisSpacing: 12.0,
                                      crossAxisSpacing: 12.0,
                                    ),
                                    itemBuilder: (context, index) {
                                      return Obx(() {
                                        return InkWell(
                                            onTap: () {
                                              selectProviderController.price.text = selectProviderController.priceList[index];
                                              selectProviderController.isSelectPrice.value = index;
                                            },
                                            highlightColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            child: Container(
                                              height: 72.w,
                                              width: 72.w,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(12.r),
                                                  color: selectProviderController.isSelectPrice.value == index
                                                      ? green
                                                      : grey.withOpacity(0.1)),
                                              child: Center(
                                                child: TextModel(
                                                  text: '\$${selectProviderController.priceList[index]}',
                                                  fontFamily: 'B',
                                                  fontSize: 14.sp,
                                                  color: selectProviderController.isSelectPrice.value == index ? white : blue,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ));
                                      });
                                    }),
                                Spacer(),
                                ButtonWidget(
                                  titleColor: white,
                                  title: 'Top Up',
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
                                                  borderRadius:
                                                      BorderRadius.only(topLeft: Radius.circular(40.r), topRight: Radius.circular(40.r))),
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
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
