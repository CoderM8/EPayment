import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelfieController extends GetxController {
  CameraController controller =
      CameraController(CameraDescription(name: '', lensDirection: CameraLensDirection.front, sensorOrientation: 5), ResolutionPreset.max);
  CameraDescription cameras = CameraDescription(name: '', lensDirection: CameraLensDirection.front, sensorOrientation: 5);

  Future initCamera(CameraDescription cameraDescription) async {
    controller = CameraController(cameraDescription, ResolutionPreset.high);
    try {
      await controller.initialize().then((_) {
        print('data-----');
        // if (!mounted) return;
        // setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  @override
  Future<void> onInit() async {
    await initCamera(cameras);
    super.onInit();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
