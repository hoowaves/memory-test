import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hoowave_memory_editor/app/modules/memory/controllers/memory_controller.dart';

class MemoryReadBox {
  static Widget build({required MemoryController controller}) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF9EA7B3),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: RawScrollbar(
          controller: controller.readScrollController,
          radius: Radius.circular(10),
          thumbVisibility: true,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  controller: controller.readScrollController,
                  children: [
                    Text("11"),
                    Gap(300),
                    Text("22"),
                  ],
                ),
                // child: ListView.builder(
                //   controller: controller.readScrollController,
                //   itemCount: controller.readMemoryList.length,
                //   itemBuilder: (context, index) {
                //     return Obx(
                //       () {
                //         return _buildItem(
                //             processId:
                //                 controller.readMemoryList[index].processId);
                //       },
                //     );
                //   },
                // ),
              ),
              Divider(),
              _buildReadText(),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildItem({required int processId}) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // controller.selectedProcessIndex.value = index;
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFFEFF1F4),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "dd",
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF565656),
              ),
            ),
          ),
        ),
        Divider(color: Color(0xFF9EA7B3), thickness: 1),
      ],
    );
  }

  static Widget _buildReadText() {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Read Memory Slot"),
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
        ],
      ),
    );
  }
}
