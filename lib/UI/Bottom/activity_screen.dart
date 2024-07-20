import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/Controller/activity_controller.dart';
import 'package:onlinepayment/res.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class ColumnChartData {
  ColumnChartData(this.time, this.p1, this.p2);

  final String time;
  final double p1;
  final double p2;
}

class ActivityScreen extends StatelessWidget {
  ActivityScreen({super.key});

  ActivityController activityController = Get.put(ActivityController());

  final List<ColumnChartData> dataday = [
    ColumnChartData('Dec 27', 2.1, 2.5),
    ColumnChartData('Dec 28', 3.2, 2.8),
    ColumnChartData('Dec 29', 3.8, 3.4),
    ColumnChartData('Dec 30', 3.0, 2.7),
    ColumnChartData('Dec 31', 3.2, 2.1),
  ];
  final List<ColumnChartData> dataweek = [
    ColumnChartData('Week 1', 2.1, 2.5),
    ColumnChartData('Week 2', 3.2, 1.8),
    ColumnChartData('Week 3', 1.8, 2.4),
    ColumnChartData('Week 4', 3.9, 2.1),
    ColumnChartData('Week 5', 1.2, 0.1),
  ];
  final List<ColumnChartData> datamonth = [
    ColumnChartData('Jan', 3.1, 2.5),
    ColumnChartData('Feb', 2.2, 1.8),
    ColumnChartData('Mar', 1.8, 3.7),
    ColumnChartData('Apr', 3.6, 3.7),
    ColumnChartData('May', 3.9, 2.9),
  ];
  final List<ColumnChartData> datayear = [
    ColumnChartData('2019', 3.1, 3.5),
    ColumnChartData('2020', 1.2, 2.9),
    ColumnChartData('2021', 1.8, 3.0),
    ColumnChartData('2022', 3.6, 2.0),
    ColumnChartData('2023', 3.1, 2.0),
  ];
  TooltipBehavior tooltip = TooltipBehavior(enable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        // leadingWidth: 70.w,
        // leading: BackButtonWidget(),
        title: TextModel(
          text: 'Activity',
          fontSize: 20.sp,
          fontFamily: 'B',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: TextModel(
                text: 'Activity',
                fontSize: 14.sp,
                fontFamily: 'B',
                color: grey,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextModel(
                    text: '\$2,265.80',
                    fontSize: 24.sp,
                    fontFamily: 'B',
                  ),
                  Container(
                    height: 32.h,
                    width: 88.w,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: grey.withOpacity(0.2)),
                    child: Center(
                      child: Obx(() {
                        return DropdownButton<String>(
                          dropdownColor: white,
                          borderRadius: BorderRadius.circular(8.r),
                          value: activityController.time.value.isEmpty ? null : activityController.time.value,
                          elevation: 16,
                          onChanged: (String? newValue) {
                            activityController.time.value = newValue!;
                          },
                          underline: SizedBox(),
                          items: <String>['Day', 'Week', 'Month', 'Year'].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Obx(() {
                return SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(minimum: 0, maximum: 4, interval: 1),
                    tooltipBehavior: tooltip,
                    series:<CartesianSeries<dynamic, dynamic>>[
                      ColumnSeries<ColumnChartData, String>(
                          dataSource: activityController.time.value == 'Day'
                              ? dataday
                              : activityController.time.value == 'Week'
                                  ? dataweek
                                  : activityController.time.value == 'Month'
                                      ? datamonth
                                      : datayear,
                          name: '',
                          xValueMapper: (ColumnChartData data, _) => data.time,
                          yValueMapper: (ColumnChartData data, _) => data.p1,
                          color: green,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r))),
                      ColumnSeries<ColumnChartData, String>(
                          dataSource: activityController.time.value == 'Day'
                              ? dataday
                              : activityController.time.value == 'Week'
                                  ? dataweek
                                  : activityController.time.value == 'Month'
                                      ? datamonth
                                      : datayear,
                          name: '',
                          xValueMapper: (ColumnChartData data, _) => data.time,
                          yValueMapper: (ColumnChartData data, _) => data.p2,
                          color: blue,
                          spacing: 0.1,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r)))
                    ]);
              }),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 155.w,
                    height: 64.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r), border: Border.all(width: 1.w, color: grey.withOpacity(0.2))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Row(
                        children: [
                          Container(
                            height: 40.w,
                            width: 40.w,
                            decoration: BoxDecoration(color: grey.withOpacity(0.2), borderRadius: BorderRadius.circular(8.r)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(R.arrowup),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextModel(
                                text: 'Income',
                                fontSize: 12.sp,
                                fontFamily: 'R',
                                color: grey,
                              ),
                              TextModel(
                                text: '\$5,300.00',
                                fontSize: 14.sp,
                                fontFamily: 'M',
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 155.w,
                    height: 64.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r), border: Border.all(width: 1.w, color: grey.withOpacity(0.2))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Row(
                        children: [
                          Container(
                            height: 40.w,
                            width: 40.w,
                            decoration: BoxDecoration(color: grey.withOpacity(0.2), borderRadius: BorderRadius.circular(8.r)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                R.arrowdown,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextModel(
                                text: 'Expense',
                                fontSize: 12.sp,
                                fontFamily: 'R',
                                color: grey,
                              ),
                              TextModel(
                                text: '\$2,265.80',
                                fontSize: 14.sp,
                                fontFamily: 'M',
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextModel(
                    text: 'Categories',
                    fontSize: 20.sp,
                    fontFamily: 'B',
                  ),
                  Row(
                    children: [
                      TextModel(
                        text: 'Expense',
                        fontSize: 14.sp,
                        fontFamily: 'M',
                      ),
                      SizedBox(width: 5.w),
                      SvgPicture.asset(R.arrow_down, color: blue),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 134.h,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 20.w),
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) {
                  return SizedBox(width: 20.w);
                },
                itemCount: activityController.categoriesList.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 134.h,
                    width: 121.w,
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r), color: grey.withOpacity(0.1)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(activityController.categoriesList[index].imgUrl),
                        Spacer(),
                        TextModel(
                          text: activityController.categoriesList[index].title,
                          fontSize: 12.sp,
                          fontFamily: 'R',
                          color: grey,
                        ),
                        SizedBox(height: 4.h),
                        TextModel(
                          text: activityController.categoriesList[index].subTitle,
                          fontSize: 16.sp,
                          fontFamily: 'B',
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
