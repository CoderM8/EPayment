import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:onlinepayment/Constant/button_widget.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Constant/text_widget.dart';
import 'package:onlinepayment/Controller/findatm_controller.dart';
import 'package:onlinepayment/res.dart';

class FindATMScreen extends StatelessWidget {
  FindATMScreen({super.key});

  final FindATMController findATMController = Get.put(FindATMController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        toolbarHeight: 70.h,
        leadingWidth: 70.w,
        leading: const BackButtonWidget(hideBorder: true, iconColor: white),
        centerTitle: true,
        title: TextModel(
          text: 'Find ATM',
          fontSize: 20.sp,
          fontFamily: 'B',
          color: white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.r), bottomRight: Radius.circular(40.r)),
              child: SizedBox(
                height: 590.h,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Obx(() {
                      findATMController.onLoad.value;
                      return GoogleMap(
                        mapType: MapType.terrain,
                        myLocationButtonEnabled: false,
                        myLocationEnabled: false,
                        compassEnabled: false,
                        zoomGesturesEnabled: true,
                        zoomControlsEnabled: false,
                        tiltGesturesEnabled: false,
                        scrollGesturesEnabled: true,
                        mapToolbarEnabled: false,
                        rotateGesturesEnabled: false,
                        markers: findATMController.markers,
                        gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                          Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer()),
                        },
                        initialCameraPosition: findATMController.cameraPosition,
                        onMapCreated: (GoogleMapController controller) async {
                          findATMController.onLoad.value = false;
                          findATMController.googleMapController = controller;
                          findATMController.markers.clear();
                          LatLng latLng = const LatLng(21.170240, 72.831062);
                          if (userLatitude.value.isNotEmpty && userLongitude.value.isNotEmpty) {
                            latLng = LatLng(double.parse(userLatitude.value), double.parse(userLongitude.value));
                          }

                          findATMController.cameraPosition = CameraPosition(target: latLng, zoom: 14.4746);

                          final Uint8List markerIcon = await findATMController.getBytesFromAsset();

                          findATMController.markers.add(
                            Marker(
                              markerId: const MarkerId('10'),
                              position: latLng,
                              infoWindow: InfoWindow(title: "You", snippet: userLocation.value),
                              icon: BitmapDescriptor.fromBytes(markerIcon),
                            ),
                          );

                          final Uint8List bankIcon = await findATMController.getBankSvg();

                          for (var marker in findATMController.bankList) {
                            findATMController.markers.add(
                              Marker(
                                markerId: MarkerId(marker.id),
                                position: LatLng(double.parse(marker.lat), double.parse(marker.lon)),
                                infoWindow: InfoWindow(title: marker.name, snippet: marker.address),
                                icon: BitmapDescriptor.fromBytes(bankIcon),
                              ),
                            );
                          }

                          await findATMController.googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
                            CameraPosition(target: latLng, zoom: 15),
                          ));
                          findATMController.onLoad.value = true;
                        },
                      );
                    }),
                    Padding(
                      padding: EdgeInsets.only(bottom: 24.h),
                      child: SizedBox(
                        height: 168.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(left: 15.w),
                          physics: BouncingScrollPhysics(),
                          itemCount: findATMController.bankList.length,
                          itemBuilder: (context, i) {
                            return Obx(() {
                              return InkWell(
                                onTap: () async {
                                  findATMController.cameraPosition = CameraPosition(
                                      target: LatLng(double.parse(findATMController.bankList[i].lat),
                                          double.parse(findATMController.bankList[i].lon)));
                                  await findATMController.googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
                                    CameraPosition(
                                        target: LatLng(double.parse(findATMController.bankList[i].lat),
                                            double.parse(findATMController.bankList[i].lon)),
                                        zoom: 15),
                                  ));
                                  CameraUpdate.newLatLng(
                                    LatLng(
                                        double.parse(findATMController.bankList[i].lat), double.parse(findATMController.bankList[i].lon)),
                                  );
                                },
                                child: Container(
                                  height: 168.h,
                                  width: 327.w,
                                  decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(20.r)),
                                  child: Padding(
                                    padding: EdgeInsets.all(16.w),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 56.h,
                                              width: 56.h,
                                              decoration:
                                                  BoxDecoration(color: grey.withOpacity(0.2), borderRadius: BorderRadius.circular(10.r)),
                                              child: Image.asset(findATMController.bankList[i].image),
                                            ),
                                            SizedBox(width: 16.w),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                TextModel(
                                                  text: findATMController.bankList[i].name,
                                                  fontSize: 16.sp,
                                                  fontFamily: 'B',
                                                ),
                                                SizedBox(height: 8.h),
                                                TextModel(
                                                  text: findATMController.bankList[i].address,
                                                  fontSize: 12.sp,
                                                  fontFamily: 'M',
                                                  color: grey,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        InkWell(
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
                                                  maxChildSize: 0.66,
                                                  initialChildSize: 0.66,
                                                  builder: (BuildContext context, ScrollController scrollController) {
                                                    return Container(
                                                      padding: EdgeInsets.all(20.w),
                                                      decoration: BoxDecoration(
                                                          color: white,
                                                          borderRadius: BorderRadius.only(
                                                              topLeft: Radius.circular(40.r), topRight: Radius.circular(40.r))),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Image.asset(R.houses),
                                                          SizedBox(height: 24.h),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              TextModel(
                                                                text: 'Bank of America',
                                                                fontSize: 24.sp,
                                                                fontFamily: 'B',
                                                              ),
                                                              SvgPicture.asset(R.bookmark),
                                                            ],
                                                          ),
                                                          SizedBox(height: 8.h),
                                                          TextModel(
                                                            text: '318 Grand St,  New York 10002, US',
                                                            fontSize: 12.sp,
                                                            fontFamily: 'M',
                                                            textAlign: TextAlign.start,
                                                            color: grey,
                                                          ),
                                                          SizedBox(height: 24.h),
                                                          SizedBox(
                                                            height: 106.h,
                                                            child: ListView.separated(
                                                                itemCount: findATMController.mapDataList.length,
                                                                physics: const BouncingScrollPhysics(),
                                                                scrollDirection: Axis.horizontal,
                                                                shrinkWrap: true,
                                                                separatorBuilder: (index, context) {
                                                                  return SizedBox(width: 12.w);
                                                                },
                                                                itemBuilder: (context, index) {
                                                                  return Column(
                                                                    children: [
                                                                      Container(
                                                                        width: 106.w,
                                                                        height: 101.h,
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(16.r),
                                                                          border: Border.all(width: 1.h, color: grey.withOpacity(0.1)),
                                                                        ),
                                                                        child: Column(
                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                          children: [
                                                                            Container(
                                                                                height: 40.w,
                                                                                width: 40.w,
                                                                                padding: EdgeInsets.all(10.w),
                                                                                decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle, color: grey.withOpacity(0.2)),
                                                                                child: SvgPicture.asset(
                                                                                    findATMController.mapDataList[index].imgUrl)),
                                                                            SizedBox(height: 16.h),
                                                                            TextModel(
                                                                              text: findATMController.mapDataList[index].title,
                                                                              textAlign: TextAlign.center,
                                                                              fontSize: 12.sp,
                                                                              fontFamily: 'M',
                                                                              color: grey,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                }),
                                                          ),
                                                          SizedBox(height: 40.h),
                                                          InkWell(
                                                            onTap: () {},
                                                            child: Container(
                                                              height: 56.h,
                                                              width: MediaQuery.sizeOf(context).width,
                                                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                                                              decoration:
                                                                  BoxDecoration(color: blue, borderRadius: BorderRadius.circular(16.r)),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  TextModel(
                                                                    text: 'Get Direction',
                                                                    fontSize: 16.sp,
                                                                    fontFamily: 'B',
                                                                    color: white,
                                                                  ),
                                                                  SvgPicture.asset(R.arrow_forward)
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height: 56.h,
                                            width: MediaQuery.sizeOf(context).width,
                                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                                            decoration: BoxDecoration(color: blue, borderRadius: BorderRadius.circular(16.r)),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                TextModel(
                                                  text: 'Get Direction',
                                                  fontSize: 16.sp,
                                                  fontFamily: 'B',
                                                  color: white,
                                                ),
                                                SvgPicture.asset(R.arrow_forward)
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                          },
                          separatorBuilder: (context, i) {
                            return SizedBox(width: 10.w);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: TextFieldModel(
                  svgUrl: R.search,
                  hint: 'Bank of America ATM',
                  color: blue,
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 15.w),
                    child: SvgPicture.asset(
                      R.close,
                      color: green,
                    ),
                  ),
                  controller: findATMController.search,
                  textInputType: TextInputType.text),
            ),
          ],
        ),
      ),
    );
  }
}
