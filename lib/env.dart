import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'app/routes/app_pages.dart';
import 'app_binding.dart';

enum BuildType { dev, prod }

class Env {
  static Env? _instance;

  static get instance => _instance;

  static bool get isDev => _instance!._buildType == BuildType.dev;

  static bool get isProd => _instance!._buildType == BuildType.prod;

  static String get libName => "hoowave_memory_editor.dll";

  static Size get appSize => Size(400, 600);

  late BuildType _buildType;

  Env(BuildType buildType) {
    _buildType = buildType;
  }

  factory Env.newInstance(BuildType buildType) {
    _instance ??= Env(buildType);
    return _instance!;
  }

  void run() async{
    WidgetsFlutterBinding.ensureInitialized();
    await DesktopWindow.setWindowSize(Env.appSize);
    await DesktopWindow.setMinWindowSize(Env.appSize);
    await DesktopWindow.setMaxWindowSize(Env.appSize);
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
