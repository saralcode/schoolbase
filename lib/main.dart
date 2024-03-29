import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolbase/pages/home/home_page.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = const WindowOptions(
    minimumSize: Size(800, 600),
    backgroundColor: Colors.transparent,
    // skipTaskbar: false,
    // titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "School Base",
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              labelStyle: TextStyle(fontSize: 18),
              errorBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.red)) ,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.blue)))),
    );
  }
}
