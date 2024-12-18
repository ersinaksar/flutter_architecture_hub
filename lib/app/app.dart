import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/providers/app_config_provider.dart';
import 'navigation/app_router.dart';

class StructureApp extends ConsumerWidget {
  const StructureApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appConfig = ref.watch(appConfigProvider);
    return MaterialApp.router(
      title: appConfig.appName,
      theme: appConfig.themeData,
      routerConfig: appRouter,
    );
  }
}
