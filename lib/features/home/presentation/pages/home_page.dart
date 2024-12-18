import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/config/app_config.dart';
import '../../../../core/providers/app_config_provider.dart';
import '../../../counter/presentation/widgets/bottom_navigation_bar.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  String appVersion = '';
  bool isOnline = false;

  @override
  void initState() {
    super.initState();
    _loadAppInfo();
  }

  Future<void> _loadAppInfo() async {
    final appConfig = ref.read(appConfigProvider);
    String version = await AppConfig.checkAppVersion();
    bool onlineStatus = await AppConfig.checkOnlineStatus();

    setState(() {
      appVersion = version;
      isOnline = onlineStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appConfig = ref.watch(appConfigProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(appConfig.appName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('App Version: $appVersion'),
            Text('Online Status: ${isOnline ? 'Online' : 'Offline'}'),
            Text('Platform: ${appConfig.platformConfig.runtimeType}'),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
