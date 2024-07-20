import 'package:camera/camera.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/constant.dart';
import 'package:onlinepayment/UI/Bottom/bottom_screen.dart';
import 'package:onlinepayment/UI/Onboarding/onboarding_screen.dart';
import 'package:onlinepayment/UI/Splash/splash_screen.dart';
import 'Constant/color.dart';
import 'Controller/findatm_controller.dart';
import 'UI/SignUp/uploadselfie_screen.dart';
import 'UI/Splash/nointernet.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await checkLocation();
  await Connectivity().checkConnectivity().then((status) {
    if (status == ConnectivityResult.none) {
      offline = true;
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) async {
      if (result == ConnectivityResult.none) {
        Future.delayed(const Duration(seconds: 3), () async {
          Get.offAll(() => const NoInternet(), transition: Transition.native);
        });
      } else {
        offline = false;
        Future.delayed(const Duration(seconds: 3), () async {
          localStorage.writeIfNull('isRegister', false);
          final bool isRegister = localStorage.read('isRegister');
          Get.offAll(() => isRegister == true ? BottomScreen() : OnBoardingScreen());
        });
      }
    });
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: 'E-Payment',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch().copyWith(primary: blue, secondary: blue),
              scaffoldBackgroundColor: white,
              useMaterial3: true,
            ),
            home: SplashScreen(),
          );
        });
  }
}
