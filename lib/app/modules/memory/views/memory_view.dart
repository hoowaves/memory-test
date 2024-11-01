import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/memory_controller.dart';

class MemoryView extends GetView<MemoryController> {
  const MemoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MemoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MemoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
