import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final GetxController controller;

  BottomNavigationBarWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
            )
        ),
        child: ClipRect(
          clipBehavior: Clip.hardEdge,
          child: BottomNavigationBar(
            currentIndex: (controller as dynamic).currentIndex.value,
            onTap: (index) {
              (controller as dynamic).currentIndex.value = index;
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.album),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check_rounded),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message_rounded),
                label: '',
              ),

            ],
          ),
        ),
      ),
    );
  }
}
