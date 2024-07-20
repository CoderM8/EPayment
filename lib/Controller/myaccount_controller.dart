import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MyAccountController extends GetxController {
  final RxBool isImageValid = false.obs;
  final RxBool onoff = false.obs;
  File? selectedImage;

  Future<void> selectImage({required ImageSource imageSource}) async {
    isImageValid.value = false;
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      selectedImage = File(image.path);
      isImageValid.value = true;
      Get.back();
    } else {
      isImageValid.value = false;
    }
  }
}
