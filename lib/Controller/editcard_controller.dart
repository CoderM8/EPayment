import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCardController extends GetxController with GetSingleTickerProviderStateMixin {
  TabController? tabController;
  RxInt tabIndex = 0.obs;
  RxBool onoff1 = false.obs;
  RxBool onoff2 = false.obs;
  RxBool onoff3 = false.obs;
  RxBool onoff4 = false.obs;
  RxBool onoff5 = false.obs;
  RxBool onoff6 = false.obs;
  RxBool onoff7 = false.obs;
  RxBool onoff8 = false.obs;
  RxBool onoff9 = false.obs;
  RxBool isSelected1 = true.obs;
  RxBool isSelected2 = false.obs;
  RxBool isSelected3 = false.obs;

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    tabController!.index = 0;
    tabController!.addListener(_smoothScrollToTop);
    super.onInit();
  }

  _smoothScrollToTop() {
    tabIndex.value = tabController!.index;
  }
}
