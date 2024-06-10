import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GamePS',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
            surfaceTint: Colors.white
        ),
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      initialRoute: AppPages.firstPage,
      getPages: AppPages.routes,
    );
  }
}
