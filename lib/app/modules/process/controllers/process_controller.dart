import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hoowave_memory_editor/app/data/service/library/library_service.dart';

import '../../../../env.dart';
import '../../widgets/common_dialog.dart';

class ProcessController extends GetxController {
  final LibraryService libraryService;

  ProcessController(this.libraryService);

  final ScrollController scrollController = ScrollController();
  List<String> processList = [
    "1 process1",
    "2 process2",
    "3 process3",
    "4 process4",
    "5 process5",
    "6 process6",
    "7 process7",
    "8 process8",
    "9 process9",
    "10 process10",
    "11 process11",
    "12 process12",
    "13 process13",
    "14 process14",
    "15 process15",
  ];
  final RxInt selectedProcessIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (!libraryService.getLoadStatus()) {
      CommonDialog.error(
          content: "${Env.libName}\nNot Load",
          onRetryPressed: () {
            Get.back();
          });
    }

  }

  @override
  void onClose() {
    super.onClose();
  }
}
