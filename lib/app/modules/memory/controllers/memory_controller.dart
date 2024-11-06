import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hoowave_memory_editor/app/data/model/memory_model.dart';

class MemoryController extends GetxController {
  final ScrollController readScrollController = ScrollController();
  final ScrollController writeScrollController = ScrollController();

  final RxList<MemoryModel> readMemoryList = <MemoryModel>[].obs;
  final RxList<MemoryModel> writeMemoryList = <MemoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
