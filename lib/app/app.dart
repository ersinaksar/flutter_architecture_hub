import 'package:flutter/material.dart';
import 'config/app_config.dart';
import 'navigation/app_router.dart';

class StructureApp extends StatelessWidget {
  const StructureApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConfig.appName,
      theme: AppConfig.themeData,
      routerConfig: appRouter,
    );
  }
}
