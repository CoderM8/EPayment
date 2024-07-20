import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinepayment/Constant/color.dart';
import 'package:onlinepayment/Controller/bottom_controller.dart';

class BottomScreen extends StatelessWidget {
  BottomScreen({super.key});

  BottomController bottomController = Get.put(BottomController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        bottomController.selectedIndex.value;
        return IndexedStack(index: bottomController.selectedIndex.value, children: bottomController.bottomPages);
      }),
      bottomNavigationBar: Obx(() {
        return BottomBarCreative(
            items: const <TabItem>[
              TabItem(
                icon: Icons.home_outlined,
                title: 'Home',
              ),
              TabItem(
                icon: Icons.credit_card_outlined,
                title: 'My Card',
              ),
              TabItem(
                icon: Icons.qr_code_scanner,
              ),
              TabItem(
                icon: Icons.add_chart,
                title: 'Activity',
              ),
              TabItem(
                icon: Icons.person_outline,
                title: 'Profile',
              ),
            ],
            backgroundColor: white,
            color: grey,
            colorSelected: blue,
            indexSelected: bottomController.selectedIndex.value,
            paddingVertical: 24,
            onTap: (int index) async {
              bottomController.selectedIndex.value = index;
            });
      }),
    );
  }
}
