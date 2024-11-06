import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:hoowave_memory_editor/app/modules/widgets/common_appbar.dart';

import '../controllers/process_controller.dart';

class ProcessView extends GetView<ProcessController> {
  const ProcessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Color(0xFFEFF1F4),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CommonAppBar.buildHeader(title: 'Please select a process'),
            Obx((){
              return _buildProcessList();
            }),
            Gap(10),
            _buildOpenButton(),
            CommonAppBar.buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildOpenButton() {
    return GestureDetector(
      onTap: () {
        controller.pushMemory();
      },
      child: Obx(
        () {
          return Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: controller.selectedProcessIndex.value == 65535
                  ? Color(0xFFBBBFC5)
                  : Color(0xFF565656), //
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Open Process',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProcessList() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF9EA7B3),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        // padding: const EdgeInsets.all(16.0),
        child: RawScrollbar(
          controller: controller.scrollController,
          // thumbColor: Colors.blue,
          radius: Radius.circular(10),
          thumbVisibility: true,
          child: ListView.builder(
            controller: controller.scrollController,
            itemCount: controller.processList.length,
            itemBuilder: (context, index) {
              print('Current index: $index, processList length: ${controller.processList.length}');
              return Obx(
                () {
                  return _buildProcessItem(index: index);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildProcessItem({required int index}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16.0, right: 16.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              controller.selectedProcessIndex.value = index;
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: controller.selectedProcessIndex.value == index
                    ? Color(0xFFCFD3DB)
                    : Color(0xFFEFF1F4),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                controller.processList[index].name,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF565656),
                ),
              ),
            ),
          ),
          Divider(color: Color(0xFF9EA7B3), thickness: 1),
        ],
      ),
    );
  }
}
