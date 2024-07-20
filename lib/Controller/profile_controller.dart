import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onlinepayment/res.dart';

class ProfileController extends GetxController {
  final RxBool isImageValid = false.obs;
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

  List<Profile> profileList = [
    Profile(title: 'Referral Code', imgUrl: R.crown),
    Profile(title: 'Account Info', imgUrl: R.profileicon),
    Profile(title: 'Contact List', imgUrl: R.contacticon),
    Profile(title: 'Language', imgUrl: R.language),
    Profile(title: 'Nearby List', imgUrl: R.map),
    Profile(title: 'General Setting', imgUrl: R.setting),
    Profile(title: 'Change Password', imgUrl: R.changepassword),
    Profile(title: 'FAQ\'s', imgUrl: R.faq),
    Profile(title: 'Help', imgUrl: R.chat),
  ];
}

class Profile {
  final String title;
  final String imgUrl;

  Profile({required this.title, required this.imgUrl});
}
