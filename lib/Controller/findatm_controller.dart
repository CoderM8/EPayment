import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:onlinepayment/res.dart';
import 'package:permission_handler/permission_handler.dart';

RxString userLocation = 'Surat, Gujarat, India'.obs;
RxString userLatitude = '21.170240'.obs;
RxString userLongitude = '72.831062'.obs;

Future<void> checkLocation() async {
  await Permission.microphone.request();
  await Permission.audio.request();
  await getUserLiveLocation().then((Position value) async {
    await placemarkFromCoordinates(value.latitude, value.longitude).then((List<Placemark> marks) async {
      if (marks.isNotEmpty) {
        Placemark place = marks[0];
        if (userLocation.value.isEmpty && userLatitude.value.isEmpty && userLongitude.value.isEmpty) {
          userLocation.value = '${place.subLocality} ${place.locality} ${place.administrativeArea} ${place.country}';
          userLatitude.value = value.latitude.toString();
          userLongitude.value = value.longitude.toString();
          print('LOCATION ${userLocation.value}  LATITUDE ${userLatitude.value}  LONGITUDE ${userLongitude.value}');
        }
      }
    });
  });
}

Future<Position> getUserLiveLocation() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    await Geolocator.openLocationSettings();
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {}
  }

  if (permission == LocationPermission.deniedForever) {}
  return await Geolocator.getCurrentPosition();
}

class FindATMController extends GetxController {
  RxList<mapData> bankList = [
    mapData(id: '1', name: 'Bank of America', image: R.boiicon, lat: '21.2423', lon: '72.878132', address: 'Mota Varachha, Surat, Guj, IN'),
    mapData(id: '2', name: 'Bank of Union', image: R.boc, lat: ' 21.230005', lon: '72.900902', address: 'Sarthana, Surat, Guj, IN'),
    mapData(id: '3', name: 'Bank of Canada', image: R.wunion, lat: '21.214689', lon: '72.888713', address: 'Yogi Chowk, Surat, Guj, IN'),
    mapData(id: '4', name: 'Bank of India', image: R.payfast, lat: '21.2407', lon: '72.9359', address: 'Pasodara, Surat, Guj, IN'),
    mapData(id: '5', name: 'Bank of Australia', image: R.boiicon, lat: '21.265884', lon: '72.951202', address: 'Kamrej, Surat, Guj, In'),
  ].obs;

  final Set<Marker> markers = {};
  GoogleMapController? googleMapController;
  Location? currentLocation;

  final RxBool onLoad = false.obs;

  TextEditingController search = TextEditingController();

  CameraPosition cameraPosition = const CameraPosition(target: LatLng(21.170240, 72.831062), zoom: 14.4746);

  Future<Uint8List> getBankSvg() async {
    ByteData bytes = await rootBundle.load(R.banklocation);
    ui.Codec codec = await ui.instantiateImageCodec(bytes.buffer.asUint8List(), targetWidth: 80.w.round(), targetHeight: 80.w.round());
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  Future<Uint8List> getBytesFromAsset() async {
    ByteData bytes = await rootBundle.load(R.location);
    ui.Codec codec = await ui.instantiateImageCodec(bytes.buffer.asUint8List(), targetWidth: 100.w.round(), targetHeight: 100.w.round());
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  List<mapList> mapDataList = [
    mapList(
      title: '350 reviews',
      imgUrl: R.star,
    ),
    mapList(
      title: '4,5 mils',
      imgUrl: R.car,
    ),
    mapList(
      title: '10:00- 11:00',
      imgUrl: R.time,
    ),
  ];

  @override
  Future<void> onInit() async {
    super.onInit();
  }
}

class mapData {
  final String id;
  final String name;
  final String lat;
  final String lon;
  final String image;
  final String address;

  mapData({required this.id, required this.name, required this.lat, required this.lon, required this.image, required this.address});
}

class mapList {
  final String title;
  final String imgUrl;

  mapList({required this.title, required this.imgUrl});
}
