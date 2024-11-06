import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hoowave_memory_editor/app/data/model/memory_model.dart';
import 'package:hoowave_memory_editor/app/data/service/memory/memory_service.dart';

import '../../../data/model/process_model.dart';

class MemoryController extends GetxController {
  final MemoryService memoryService;
  late ProcessModel processModel;

  final ScrollController readScrollController = ScrollController();
  final ScrollController writeScrollController = ScrollController();

  final RxList<MemoryModel> readMemoryList = <MemoryModel>[].obs;
  final RxList<MemoryModel> writeMemoryList = <MemoryModel>[].obs;

  MemoryController(this.memoryService);

  @override
  void onInit() {
    super.onInit();
    processModel = ProcessModel(pid: 123, name: "test.exe");
    // readMemoryList.value = generateDummyData();
  }

  @override
  void onReady() {
    super.onReady();
    // processModel = Get.arguments;
  }

  @override
  void onClose() {
    super.onClose();
  }

  void addReadSlot() {
    readMemoryList.add(MemoryModel(address: 0, value: null));
  }

  void deleteReadSlot(int index) {
    readMemoryList.removeAt(index);
  }

  void readMemory() {
    // memoryService.readMemory(processModel.pid);
  }

  void writeMemory(int index, int value) {
    // memoryService.writeMemory(processModel.pid, index, value);
  }

  void setDropBox(MemoryModel memoryModel, MemoryFormat memoryFormat) {
    memoryModel.selectedFormat.value = memoryFormat;
  }

// List<MemoryModel> generateDummyData() {
//   return [
//     MemoryModel(address: 0x7ff00001, value: 1000000),
//     MemoryModel(address: 0x7ff00002, value: 100000),
//     MemoryModel(address: 0x7ff00003, value: 10000),
//     MemoryModel(address: 0x7ff00004, value: 1000),
//     MemoryModel(address: 0x7ff00005, value: 100),
//   ];
// }
}
