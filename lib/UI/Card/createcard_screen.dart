import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/Controller/createcard_controller.dart';
import 'package:onlinepayment/UI/Bottom/bottom_screen.dart';
import 'package:onlinepayment/res.dart';

class CreateCardScreen extends StatelessWidget {
  CreateCardScreen({super.key});

  CreateCardController createCardController = Get.put(CreateCardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
        leadingWidth: 70.w,
        title: TextModel(text: 'New Card', fontFamily: 'B', fontSize: 20.sp, color: black),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            return Stack(
              alignment: Alignment.centerRight,
              children: [
                if (createCardController.isSelected2.value) ...[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    height: 290.h,
                    width: MediaQuery.sizeOf(context).width,
                    color: grey.withOpacity(0.2),
                    child: SvgPicture.asset(R.card2),
                  ),
                ] else if (createCardController.isSelected3.value) ...[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    height: 290.h,
                    width: MediaQuery.sizeOf(context).width,
                    color: grey.withOpacity(0.2),
                    child: SvgPicture.asset(R.card2c3),
                  ),
                ] else ...[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    height: 290.h,
                    width: MediaQuery.sizeOf(context).width,
                    color: grey.withOpacity(0.2),
                    child: SvgPicture.asset(R.card2c1),
                  ),
                ],
                Container(
                  height: 134.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(12.r), bottomLeft: Radius.circular(12.r)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Obx(() {
                        return InkWell(
                          onTap: () {
                            createCardController.isSelected1.value = !createCardController.isSelected1.value;
                            createCardController.isSelected2.value = false;
                            createCardController.isSelected3.value = false;
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 12.w,
                                    width: 24.w,
                                    padding: EdgeInsets.zero,
                                    margin: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      color: blue,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(100.r), topRight: Radius.circular(100.r)),
                                    ),
                                  ),
                                  Container(
                                    height: 12.w,
                                    width: 24.w,
                                    padding: EdgeInsets.zero,
                                    margin: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      color: cream,
                                      borderRadius:
                                          BorderRadius.only(bottomLeft: Radius.circular(100.r), bottomRight: Radius.circular(100.r)),
                                    ),
                                  )
                                ],
                              ),
                              if (createCardController.isSelected1.value) SvgPicture.asset(R.ischecked)
                            ],
                          ),
                        );
                      }),
                      Obx(() {
                        return InkWell(
                          onTap: () {
                            createCardController.isSelected2.value = !createCardController.isSelected2.value;
                            createCardController.isSelected1.value = false;
                            createCardController.isSelected3.value = false;
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 12.w,
                                    width: 24.w,
                                    padding: EdgeInsets.zero,
                                    margin: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      color: blue,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(100.r), topRight: Radius.circular(100.r)),
                                    ),
                                  ),
                                  Container(
                                    height: 12.w,
                                    width: 24.w,
                                    padding: EdgeInsets.zero,
                                    margin: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      color: green,
                                      borderRadius:
                                          BorderRadius.only(bottomLeft: Radius.circular(100.r), bottomRight: Radius.circular(100.r)),
                                    ),
                                  )
                                ],
                              ),
                              if (createCardController.isSelected2.value) SvgPicture.asset(R.ischecked)
                            ],
                          ),
                        );
                      }),
                      Obx(() {
                        return InkWell(
                          onTap: () {
                            createCardController.isSelected3.value = !createCardController.isSelected3.value;
                            createCardController.isSelected1.value = false;
                            createCardController.isSelected2.value = false;
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 12.w,
                                    width: 24.w,
                                    padding: EdgeInsets.zero,
                                    margin: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      color: green,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(100.r), topRight: Radius.circular(100.r)),
                                    ),
                                  ),
                                  Container(
                                    height: 12.w,
                                    width: 24.w,
                                    padding: EdgeInsets.zero,
                                    margin: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      color: cream,
                                      borderRadius:
                                          BorderRadius.only(bottomLeft: Radius.circular(100.r), bottomRight: Radius.circular(100.r)),
                                    ),
                                  )
                                ],
                              ),
                              if (createCardController.isSelected3.value) SvgPicture.asset(R.ischecked)
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ],
            );
          }),
          SizedBox(height: 24.h),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextModel(text: 'Card Detail', textAlign: TextAlign.start, fontSize: 18.sp),
                    SizedBox(height: 16.h),
                    TextFieldModel(
                      hint: 'Card number',
                      controller: createCardController.cardNumber,
                      textInputType: TextInputType.number,
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 15.w),
                        child: SvgPicture.asset(R.cardnumbericon),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextFieldModel(
                            hint: 'Expiry date',
                            controller: createCardController.date,
                            textInputType: TextInputType.datetime,
                            textInputAction: TextInputAction.next,
                            onChanged: (v) {
                              if (createCardController.date.text.startsWith(RegExp('[2-9]'))) {
                                createCardController.date.text = '0 ${createCardController.date.text}';
                              }
                            },
                            validation: (value) {
                              if (value!.isEmpty) {
                                return 'Please input a valid date';
                              }
                              final DateTime now = DateTime.now();
                              final List<String> date = value.split(RegExp(r'/'));
                              final int month = int.parse(date.first);
                              final int year = int.parse('20${date.last}');
                              final int lastDayOfMonth = month < 12 ? DateTime(year, month + 1, 0).day : DateTime(year + 1, 1, 0).day;
                              final DateTime cardDate = DateTime(year, month, lastDayOfMonth, 23, 59, 59, 999);

                              if (cardDate.isBefore(now) || month > 12 || month == 0) {
                                return 'invalid date';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextFieldModel(
                            hint: 'CVV',
                            controller: createCardController.cvv,
                            textInputType: TextInputType.number,
                            validation: (value) {
                              if (/*value!.isEmpty || */ value!.length < 3) {
                                return "Please input a valid CVV";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    TextFieldModel(
                      hint: 'Card holder',
                      controller: createCardController.cardName,
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(height: 16.h),
                    Obx(() {
                      return ListTile(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            countryListTheme: CountryListThemeData(
                              flagSize: 30,
                              backgroundColor: Colors.white,
                              textStyle: TextStyle(fontSize: 16.sp, color: blue),
                              bottomSheetHeight: 500,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                              inputDecoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                                counterStyle: const TextStyle(color: black),
                                fillColor: grey.withOpacity(0.1),
                                filled: true,
                                hintText: 'Search',
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SvgPicture.asset(R.search),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(16.r)),
                                    borderSide: BorderSide(width: 1.w, color: black)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(16.r)),
                                    borderSide: BorderSide(width: 1.w, color: white)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(16.r)),
                                    borderSide: BorderSide(width: 1.w, color: white)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(16.r)),
                                    borderSide: BorderSide(width: 1.w, color: white)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(16.r)),
                                    borderSide: BorderSide(width: 1.w, color: const Color(0xffDC3545))),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(16.r)),
                                    borderSide: BorderSide(width: 1.w, color: const Color(0xffDC3545))),
                              ),
                            ),
                            onSelect: (Country country) {
                              createCardController.countryName.value = country.name;
                              createCardController.countryFlag.value = country.flagEmoji;
                            },
                          );
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                        tileColor: grey.withOpacity(0.1),
                        leading: TextModel(
                          text: createCardController.countryFlag.value,
                          fontFamily: 'B',
                          fontSize: 20.sp,
                          textAlign: TextAlign.start,
                        ),
                        title: TextModel(
                          text: createCardController.countryName.value,
                          fontFamily: 'B',
                          fontSize: 18.sp,
                          textAlign: TextAlign.start,
                        ),
                        trailing: SvgPicture.asset(R.arrow_down),
                      );
                    }),
                    SizedBox(height: 26.h),
                    ButtonWidget(
                        titleColor: white,
                        title: 'Save',
                        onTap: () {
                          Get.dialog(
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Dialog(
                                    backgroundColor: Colors.transparent,
                                    child: CustomPaint(
                                      size: Size(
                                          260,
                                          (260 * 0.8206896551724138)
                                              .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                      painter: RPSCustomPainter(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 64.h),
                                          TextModel(text: 'Great! your card is ready🙂', fontFamily: 'B', fontSize: 20.sp),
                                          SizedBox(height: 12.h),
                                          TextModel(
                                              text: 'Now you can shop, transmit and transfer\nconveniently',
                                              textAlign: TextAlign.center,
                                              fontFamily: 'R',
                                              fontSize: 12.sp),
                                          SizedBox(height: 22.h),
                                          ButtonWidget(
                                              width: 250.w,
                                              titleColor: white,
                                              title: 'Ok, I’m ready!',
                                              onTap: () {
                                                Get.offAll(() => BottomScreen());
                                              }),
                                          SizedBox(height: 30.h),
                                        ],
                                      ),
                                    )),

                                // Dialog(
                                //   backgroundColor: white,
                                //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                                //   child: Padding(
                                //     padding: EdgeInsets.fromLTRB(20.w, 80.h, 20.w, 0.0),
                                //     child: Container(
                                //       height: 180.h,
                                //       child: Column(
                                //         crossAxisAlignment: CrossAxisAlignment.center,
                                //         children: [
                                //           TextModel(text: 'Great! your card is ready🙂', fontFamily: 'B', fontSize: 20.sp),
                                //           SizedBox(height: 12.h),
                                //           TextModel(
                                //               text: 'Now you can shop, transmit and transfer\nconveniently',
                                //               textAlign: TextAlign.center,
                                //               fontFamily: 'R',
                                //               fontSize: 12.sp),
                                //           SizedBox(height: 22.h),
                                //           ButtonWidget(
                                //               titleColor: white,
                                //               title: 'Ok, I’m ready!',
                                //               onTap: () {
                                //                 Get.offAll(() => BottomScreen());
                                //               }),
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                Positioned(
                                    top: 210.h,
                                    child: Container(
                                        height: 88.w,
                                        width: 88.w,
                                        padding: EdgeInsets.all(8.w),
                                        decoration: const BoxDecoration(color: white, shape: BoxShape.circle),
                                        child: Container(
                                            height: 78.w,
                                            width: 78.w,
                                            decoration: BoxDecoration(color: grey.withOpacity(0.1), shape: BoxShape.circle),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: SvgPicture.asset(R.twocard),
                                            )))),
                              ],
                            ),
                          );
                        }),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3667379, size.height * 0.07953193);
    path_0.cubicTo(size.width * 0.3428448, size.height * 0.04037983, size.width * 0.3308990, size.height * 0.02080382,
        size.width * 0.3259576, size.height * 0.01574710);
    path_0.cubicTo(size.width * 0.3158183, size.height * 0.005371345, size.width * 0.3160893, size.height * 0.005537311,
        size.width * 0.3032062, size.height * 0.001814382);
    path_0.cubicTo(size.width * 0.2969276, 0, size.width * 0.2872759, 0, size.width * 0.2679728, 0);
    path_0.lineTo(size.width * 0.1034483, 0);
    path_0.cubicTo(size.width * 0.07131448, 0, size.width * 0.05524759, 0, size.width * 0.04257345, size.height * 0.006396681);
    path_0.cubicTo(size.width * 0.02567507, size.height * 0.01492559, size.width * 0.01224928, size.height * 0.03128475,
        size.width * 0.005249690, size.height * 0.05187521);
    path_0.cubicTo(0, size.height * 0.06731849, 0, size.height * 0.08689580, 0, size.height * 0.1260504);
    path_0.lineTo(0, size.height * 0.8739496);
    path_0.cubicTo(0, size.height * 0.9131050, 0, size.height * 0.9326807, size.width * 0.005249690, size.height * 0.9481261);
    path_0.cubicTo(size.width * 0.01224928, size.height * 0.9687143, size.width * 0.02567507, size.height * 0.9850756,
        size.width * 0.04257345, size.height * 0.9936050);
    path_0.cubicTo(size.width * 0.05524759, size.height, size.width * 0.07131448, size.height, size.width * 0.1034483, size.height);
    path_0.lineTo(size.width * 0.8965517, size.height);
    path_0.cubicTo(
        size.width * 0.9286862, size.height, size.width * 0.9447517, size.height, size.width * 0.9574276, size.height * 0.9936050);
    path_0.cubicTo(size.width * 0.9743241, size.height * 0.9850756, size.width * 0.9877517, size.height * 0.9687143, size.width * 0.9947517,
        size.height * 0.9481261);
    path_0.cubicTo(size.width, size.height * 0.9326807, size.width, size.height * 0.9131050, size.width, size.height * 0.8739496);
    path_0.lineTo(size.width, size.height * 0.1260504);
    path_0.cubicTo(
        size.width, size.height * 0.08689580, size.width, size.height * 0.06731849, size.width * 0.9947517, size.height * 0.05187521);
    path_0.cubicTo(size.width * 0.9877517, size.height * 0.03128475, size.width * 0.9743241, size.height * 0.01492559,
        size.width * 0.9574276, size.height * 0.006396681);
    path_0.cubicTo(size.width * 0.9447517, 0, size.width * 0.9286862, 0, size.width * 0.8965517, 0);
    path_0.lineTo(size.width * 0.7354759, 0);
    path_0.cubicTo(size.width * 0.7161724, 0, size.width * 0.7065207, 0, size.width * 0.7002414, size.height * 0.001814382);
    path_0.cubicTo(size.width * 0.6873586, size.height * 0.005537311, size.width * 0.6876310, size.height * 0.005371345,
        size.width * 0.6774897, size.height * 0.01574710);
    path_0.cubicTo(size.width * 0.6725483, size.height * 0.02080378, size.width * 0.6606034, size.height * 0.04037983,
        size.width * 0.6367103, size.height * 0.07953193);
    path_0.cubicTo(size.width * 0.6071759, size.height * 0.1279345, size.width * 0.5577310, size.height * 0.1596639, size.width * 0.5017241,
        size.height * 0.1596639);
    path_0.cubicTo(size.width * 0.4457172, size.height * 0.1596639, size.width * 0.3962724, size.height * 0.1279345, size.width * 0.3667379,
        size.height * 0.07953193);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.white;
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
