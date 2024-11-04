import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:hoowave_memory_editor/app/modules/memory/views/widgets/memory_read_box.dart';
import 'package:hoowave_memory_editor/app/modules/memory/views/widgets/memory_write_box.dart';

import '../../widgets/common_appbar.dart';
import '../controllers/memory_controller.dart';

class MemoryView extends GetView<MemoryController> {
  const MemoryView({super.key});

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
            CommonAppBar.buildHeader(title: 'Process Name'),
            MemoryReadBox.build(controller: controller),
            Gap(20),
            MemoryWriteBox.build(controller: controller),
            CommonAppBar.buildFooter(),
          ],
        ),
      ),
    );
  }

}
