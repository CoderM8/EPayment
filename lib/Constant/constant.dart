import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';

import 'color.dart';

bool offline = false;

final localStorage = GetStorage();

showToast({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: grey.withOpacity(0.2),
    textColor: black,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    fontSize: 16.sp,
  );
}
