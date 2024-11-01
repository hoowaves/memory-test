import 'dart:ffi' as ffi;
import 'dart:ui' as ui;

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:win32/win32.dart';

import 'app/routes/app_pages.dart';
import 'app_binding.dart';

enum BuildType { dev, prod }

class Env {
  static Env? _instance;

  static get instance => _instance;

  static bool get isDev => _instance!._buildType == BuildType.dev;

  static bool get isProd => _instance!._buildType == BuildType.prod;

  static Size get appSize => const Size(400, 600);

  static String get libName => "assets/dlls/hoowave_memory_editor.dll";

  late BuildType _buildType;

  Env(BuildType buildType) {
    _buildType = buildType;
  }

  factory Env.newInstance(BuildType buildType) {
    _instance ??= Env(buildType);
    return _instance!;
  }

  Future<void> setWindow() async{
    WidgetsFlutterBinding.ensureInitialized();
    await DesktopWindow.setWindowSize(Env.appSize);
    await DesktopWindow.setMinWindowSize(Env.appSize);
    await DesktopWindow.setMaxWindowSize(Env.appSize);
    final className = TEXT('FLUTTER_RUNNER_WIN32_WINDOW');
    await Future.delayed(const Duration(milliseconds: 100));
    final hwnd = FindWindow(className, ffi.nullptr);
    if (hwnd != 0) {
      final style = GetWindowLongPtr(hwnd, GWL_STYLE);
      SetWindowLongPtr(hwnd, GWL_STYLE, style & ~WS_SIZEBOX & ~WS_MAXIMIZEBOX);
    }
  }

  void run() async{
    await setWindow();
    runApp(const Init());
  }
}

class Init extends StatelessWidget {
  const Init({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Hoowave Memory Editor",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      themeMode: ThemeMode.light,
      theme: ThemeData.light(),
      initialBinding: AppBinding(),
    );
  }

}
