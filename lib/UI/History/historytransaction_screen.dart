import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/Controller/historytransaction_controller.dart';
import 'package:onlinepayment/res.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}

class HistoryTransactionScreen extends StatelessWidget {
  HistoryTransactionScreen({super.key});

  HistoryTransactionController historyTransactionController = Get.put(HistoryTransactionController());

  final List<ChartData> data = [
    ChartData('Jan', 90),
    ChartData('Feb', 70),
    ChartData('Mar', 120),
    ChartData('Apr', 100),
    ChartData('May', 160),
    ChartData('Jun', 50),
  ];
  TooltipBehavior tooltip = TooltipBehavior(enable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.h,
        backgroundColor: white,
        centerTitle: true,
        leadingWidth: 70.w,
        leading: BackButtonWidget(),
        title: TextModel(
          text: 'Line',
          fontSize: 20.sp,
          fontFamily: 'B',
        ),
        actions: [
          BackButtonWidget(
            svgUrl: R.moremenu,
            onTap: () {},
          ),
          SizedBox(width: 15.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextModel(
                      text: '\$568.18',
                      fontSize: 24.sp,
                      textAlign: TextAlign.start,
                      fontFamily: 'B',
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(R.arrowdown),
                        RichText(
                          text: TextSpan(
                              text: '25.6%',
                              style: TextStyle(
                                color: blue,
                                fontFamily: 'M',
                                fontSize: 12.sp,
                              ),
                              children: [
                                TextSpan(text: ' from last month', style: TextStyle(color: grey, fontFamily: 'R', fontSize: 12.sp))
                              ]),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                BackButtonWidget(
                  svgUrl: R.chart,
                  onTap: () {},
                ),
                SizedBox(width: 5.w),
                BackButtonWidget(
                  ismargin: true,
                  svgUrl: R.chartbar,
                  hideBorder: true,
                  onTap: () {},
                  backGroundColor: grey.withOpacity(0.2),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(minimum: 0, maximum: 160, interval: 40),
                tooltipBehavior: tooltip,
                series: <CartesianSeries<dynamic, dynamic>>[
                  ColumnSeries<ChartData, String>(
                      dataSource: data,
                      name: '',
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      color: grey.withOpacity(0.5),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r)),
                      selectionBehavior: SelectionBehavior(enable: true, selectedColor: green, unselectedColor: grey))
                ]),
            SizedBox(height: 25.h),
            Obx(() {
              return historyTransactionController.isSearch.value == true
                  ? TextFieldModel(
                      hint: 'Search',
                      svgUrl: R.search,
                      controller: historyTransactionController.search,
                      textInputType: TextInputType.text,
                      suffixIcon: InkWell(
                          onTap: () {
                            historyTransactionController.isSearch.value = false;
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: SvgPicture.asset(
                              R.close,
                              height: 18.w,
                              width: 18.w,
                              color: black,
                            ),
                          )),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextModel(
                          text: 'All Transactions',
                          fontSize: 20.sp,
                          fontFamily: 'B',
                          textAlign: TextAlign.start,
                        ),
                        InkWell(
                            onTap: () {
                              historyTransactionController.isSearch.value = true;
                            },
                            child: SvgPicture.asset(R.search)),
                      ],
                    );
            }),
            SizedBox(height: 5.h),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: historyTransactionController.allTranscationList.length,
                    separatorBuilder: (index, context) {
                      return Divider(color: lightgrey.withOpacity(1));
                    },
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 56.h,
                        width: 327.w,
                        child: Row(
                          children: [
                            Container(
                                height: 48.w,
                                width: 48.w,
                                decoration: BoxDecoration(
                                  color: lightgrey.withOpacity(1),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.w),
                                  child: SvgPicture.asset(historyTransactionController.allTranscationList[index].imgUrl),
                                )),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: TextModel(
                                          text: historyTransactionController.allTranscationList[index].title,
                                          fontSize: 14.sp,
                                          fontFamily: 'B',
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      TextModel(
                                        text: historyTransactionController.allTranscationList[index].price,
                                        fontSize: 14.sp,
                                        fontFamily: 'B',
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: TextModel(
                                          text: historyTransactionController.allTranscationList[index].subTitle,
                                          fontSize: 12.sp,
                                          fontFamily: 'M',
                                          textAlign: TextAlign.start,
                                          color: grey,
                                        ),
                                      ),
                                      TextModel(
                                        text: historyTransactionController.allTranscationList[index].time,
                                        fontSize: 12.sp,
                                        fontFamily: 'M',
                                        textAlign: TextAlign.start,
                                        color: grey,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
