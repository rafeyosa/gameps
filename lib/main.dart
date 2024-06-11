import 'package:flutter/material.dart';
import 'package:gameps/data/datasources/api_provider_manager.dart';
import 'package:gameps/data/repositories/repository_manager.dart';
import 'package:get/get.dart';

import 'core/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ApiProviderManager.initialize();
  RepositoryManager.initialize();

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
        colorScheme: const ColorScheme.light(surfaceTint: Colors.white),
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      initialRoute: AppPages.firstPage,
      getPages: AppPages.routes,
    );
  }
}
